using ProposalSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProposalSystem.Controllers
{
    public class UnitController : Controller
    {
        private ProposalSystemEntities db = new ProposalSystemEntities();

        //
        // GET: /Unit/

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Submit()
        {

            ProposalSystemEntities db = new ProposalSystemEntities();
            Result r1 = db.Result.Find(Session["resultid"]);
            r1.result1 = Request["opinion"];
            r1.ExecutionContent = Request["work"];
            r1.Date = DateTime.Now;
            db.SaveChanges();
            Response.Write("<script>alert('提交成功');</script>");

            return View("Index");
        }

    }
}
