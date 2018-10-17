using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProposalSystem.Models;

namespace ProposalSystem.Controllers
{
    public class ResultController : Controller
    {
        private ProposalSystemEntities db = new ProposalSystemEntities();

        //
        // GET: /Result/

        public ActionResult Index()
        {
            var departmentid = int.Parse(Session["departmentid"].ToString());
            var result = db.Result.Include(r => r.Department1).Include(r => r.Proposal1)
                .Where(m => m.Department == departmentid && m.result1 == null);
            return View(result.ToList());
        }

        //
        // GET: /Result/Details/5

        public ActionResult Details(int id = 0)
        {
            Result result = db.Result.Find(id);
            if (result == null)
            {
                return HttpNotFound();
            }
            Session["resultid"] = id;
            return View(result);
        }

        //
        // GET: /Result/Create

        public ActionResult Create()
        {
            ViewBag.Department = new SelectList(db.Department, "ID", "Name");
            ViewBag.Proposal = new SelectList(db.Proposal, "ID", "Title");
            return View();
        }

        //
        // POST: /Result/Create

        [HttpPost]
        public ActionResult Create(Result result)
        {
            if (ModelState.IsValid)
            {
                db.Result.Add(result);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Department = new SelectList(db.Department, "ID", "Name", result.Department);
            ViewBag.Proposal = new SelectList(db.Proposal, "ID", "Title", result.Proposal);
            return View(result);
        }

        //
        // GET: /Result/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Result result = db.Result.Find(id);
            if (result == null)
            {
                return HttpNotFound();
            }
            ViewBag.Department = new SelectList(db.Department, "ID", "Name", result.Department);
            ViewBag.Proposal = new SelectList(db.Proposal, "ID", "Title", result.Proposal);
            return View(result);
        }

        //
        // POST: /Result/Edit/5

        [HttpPost]
        public ActionResult Edit(Result result)
        {
            if (ModelState.IsValid)
            {
                db.Entry(result).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Department = new SelectList(db.Department, "ID", "Name", result.Department);
            ViewBag.Proposal = new SelectList(db.Proposal, "ID", "Title", result.Proposal);
            return View(result);
        }

        //
        // GET: /Result/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Result result = db.Result.Find(id);
            if (result == null)
            {
                return HttpNotFound();
            }
            return View(result);
        }

        //
        // POST: /Result/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Result result = db.Result.Find(id);
            db.Result.Remove(result);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}