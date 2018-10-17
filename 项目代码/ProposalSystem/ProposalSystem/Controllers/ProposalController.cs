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
    public class ProposalController : Controller
    {
        private ProposalSystemEntities db = new ProposalSystemEntities();

        //
        // GET: /Proposal/

        public ActionResult Index()
        {
            var proposal = db.Proposal.Include(p => p.Department).Include(p => p.ProposalType).Include(p => p.User);
            return View(proposal.ToList());
        }

        //
        // GET: /Proposal/Details/5

        public ActionResult Details(int id = 0)
        {
            Proposal proposal = db.Proposal.Find(id);
            if (proposal == null)
            {
                return HttpNotFound();
            }
            Session["proposalid"] = id;
            return View(proposal);
        }

        //
        // GET: /Proposal/Create

        public ActionResult Create()
        {
            ViewBag.ProcessingDepartment = new SelectList(db.Department, "ID", "Name");
            ViewBag.Type = new SelectList(db.ProposalType, "ID", "Type");
            ViewBag.MainProposer = new SelectList(db.User, "ID", "UserName");
            return View();
        }

        //
        // POST: /Proposal/Create

        [HttpPost]
        public ActionResult Create(Proposal proposal)
        {
            if (ModelState.IsValid)
            {
                db.Proposal.Add(proposal);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProcessingDepartment = new SelectList(db.Department, "ID", "Name", proposal.ProcessingDepartment);
            ViewBag.Type = new SelectList(db.ProposalType, "ID", "Type", proposal.Type);
            ViewBag.MainProposer = new SelectList(db.User, "ID", "UserName", proposal.MainProposer);
            return View(proposal);
        }

        //
        // GET: /Proposal/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Proposal proposal = db.Proposal.Find(id);
            if (proposal == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProcessingDepartment = new SelectList(db.Department, "ID", "Name", proposal.ProcessingDepartment);
            ViewBag.Type = new SelectList(db.ProposalType, "ID", "Type", proposal.Type);
            ViewBag.MainProposer = new SelectList(db.User, "ID", "UserName", proposal.MainProposer);
            return View(proposal);
        }

        //
        // POST: /Proposal/Edit/5

        [HttpPost]
        public ActionResult Edit(Proposal proposal)
        {
            if (ModelState.IsValid)
            {
                db.Entry(proposal).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProcessingDepartment = new SelectList(db.Department, "ID", "Name", proposal.ProcessingDepartment);
            ViewBag.Type = new SelectList(db.ProposalType, "ID", "Type", proposal.Type);
            ViewBag.MainProposer = new SelectList(db.User, "ID", "UserName", proposal.MainProposer);
            return View(proposal);
        }

        //
        // GET: /Proposal/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Proposal proposal = db.Proposal.Find(id);
            if (proposal == null)
            {
                return HttpNotFound();
            }
            return View(proposal);
        }

        //
        // POST: /Proposal/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Proposal proposal = db.Proposal.Find(id);
            db.Proposal.Remove(proposal);
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