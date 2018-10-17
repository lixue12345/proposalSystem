using ProposalSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProposalSystem.Controllers
{
    public class AdministratorController : Controller
    {
        //
        // GET: /Administrator/

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Submit()
        {

            ProposalSystemEntities db = new ProposalSystemEntities();
            Result r1 = new Result();
            r1.Proposal = int.Parse(Session["proposalid"].ToString());
            r1.Register = Request["result"];
            r1.Instruction = Request["instruction"];
            r1.Date = DateTime.Now;
            
            if (Request["result"] == "立案") {
                r1.Department = int.Parse(Request["department"].ToString());
            }
    
            db.Result.Add(r1);
            db.SaveChanges();
            Response.Write("<script>alert('提交成功');</script>");

            return View("Index");
        }

    }
}
