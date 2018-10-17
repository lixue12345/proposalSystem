using ProposalSystem.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProposalSystem.Controllers
{
    public class TeacherController : Controller
    {
        ProposalSystemEntities db = new ProposalSystemEntities();
        //
        // GET: /Teacher/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Form()
        {
            ViewBag.UserID = Session["userid"];
            return View();
        }

        [HttpPost]
        public ActionResult Submit()
        {
            Proposal pl = new Proposal();
            pl.Title = Request["title"];
            pl.Content = Request["content"];
            pl.Type = int.Parse(Request["op"]);
            pl.MainProposer = int.Parse(Session["userid"].ToString());
            pl.Co_Proposers = Request["co-sponsor"];
            pl.ProcessingDepartment = int.Parse(Request["processingdepartment"]);
            pl.Date = DateTime.Now;
            db.Proposal.Add(pl);
            db.SaveChanges();
            Response.Write("<script>alert('提交成功');</script>");

            return View("Index");
        }

        public ActionResult Done()
        {
            var teacherid = int.Parse(Session["teacherid"].ToString());
            var proposal = db.Proposal.Where(m => m.User.ID == teacherid);
            return View(proposal.ToList());
        }

        public ActionResult Details(int id = 0)
        {
            Proposal proposal = db.Proposal.Find(id);
            if (proposal == null)
            {
                return HttpNotFound();
            }
            //Session["resultid"] = id;
            return View(proposal);
        }

        public ActionResult Submitted()
        {
            var teacherid = int.Parse(Session["teacherid"].ToString());
            var result = db.Result.Where(m => m.Proposal1.User.ID == teacherid);
            return View(result.ToList());
        }

        public ActionResult Evaluate(int id = 0)
        {
            Result result = db.Result.Find(id);
            if (result == null)
            {
                return HttpNotFound();
            }
            Session["resultid"] = id;
            return View(result);
        }

        [HttpPost]
        public ActionResult EvaluationSubmit()
        {
            FeedBack f1 = new FeedBack();
            f1.Result = int.Parse(Session["resultid"].ToString());
            f1.ProposerOpinion = Request["evaluation"];
            f1.Date = DateTime.Now;
            db.FeedBack.Add(f1);
            db.SaveChanges();
            Response.Write("<script>alert('评价成功！');</script>");
            return View("Index");
        }
        
    }
}
