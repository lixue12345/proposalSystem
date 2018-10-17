using ProposalSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProposalSystem.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(User model)
        {
            ProposalSystemEntities db = new ProposalSystemEntities();
            
            if (ModelState.IsValid)
            {
                var userinfo = db.User.FirstOrDefault(m => m.Account == model.Account && m.Password == model.Password);
                if (userinfo != null)
                {
                    Session["userid"] = userinfo.ID;
                    if (userinfo.UserType == 1)
                    {
                        Session["teacherid"] = userinfo.ID;
                        return RedirectToAction("Index", "Teacher");
                    }
                    if (userinfo.UserType == 2)
                    {
                        return RedirectToAction("Index","Administrator");
                    }
                    if (userinfo.UserType == 3)
                    {
                        Session["departmentid"] = userinfo.Department;
                        return RedirectToAction("Index","Unit");
                    }
                    
                }
            }
            Response.Write("<script>alert('账号或密码错误！');</script>");
            return View();
        }

    }
}
