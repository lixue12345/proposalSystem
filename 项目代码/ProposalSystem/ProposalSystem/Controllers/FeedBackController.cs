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
    public class FeedBackController : Controller
    {
        private ProposalSystemEntities db = new ProposalSystemEntities();

        //
        // GET: /FeedBack/

        public ActionResult Index()
        {
            var feedback = db.FeedBack.Include(f => f.Result1);
            return View(feedback.ToList());
        }

        //
        // GET: /FeedBack/Details/5

        public ActionResult Details(int id = 0)
        {
            FeedBack feedback = db.FeedBack.Find(id);
            if (feedback == null)
            {
                return HttpNotFound();
            }
            return View(feedback);
        }

        //
        // GET: /FeedBack/Create

        public ActionResult Create()
        {
            ViewBag.Result = new SelectList(db.Result, "ID", "Register");
            return View();
        }

        //
        // POST: /FeedBack/Create

        [HttpPost]
        public ActionResult Create(FeedBack feedback)
        {
            if (ModelState.IsValid)
            {
                db.FeedBack.Add(feedback);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Result = new SelectList(db.Result, "ID", "Register", feedback.Result);
            return View(feedback);
        }

        //
        // GET: /FeedBack/Edit/5

        public ActionResult Edit(int id = 0)
        {
            FeedBack feedback = db.FeedBack.Find(id);
            if (feedback == null)
            {
                return HttpNotFound();
            }
            ViewBag.Result = new SelectList(db.Result, "ID", "Register", feedback.Result);
            return View(feedback);
        }

        //
        // POST: /FeedBack/Edit/5

        [HttpPost]
        public ActionResult Edit(FeedBack feedback)
        {
            if (ModelState.IsValid)
            {
                db.Entry(feedback).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Result = new SelectList(db.Result, "ID", "Register", feedback.Result);
            return View(feedback);
        }

        //
        // GET: /FeedBack/Delete/5

        public ActionResult Delete(int id = 0)
        {
            FeedBack feedback = db.FeedBack.Find(id);
            if (feedback == null)
            {
                return HttpNotFound();
            }
            return View(feedback);
        }

        //
        // POST: /FeedBack/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            FeedBack feedback = db.FeedBack.Find(id);
            db.FeedBack.Remove(feedback);
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