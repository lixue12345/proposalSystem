﻿//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProposalSystem.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ProposalSystemEntities : DbContext
    {
        public ProposalSystemEntities()
            : base("name=ProposalSystemEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Department> Department { get; set; }
        public DbSet<FeedBack> FeedBack { get; set; }
        public DbSet<Proposal> Proposal { get; set; }
        public DbSet<ProposalType> ProposalType { get; set; }
        public DbSet<Result> Result { get; set; }
        public DbSet<User> User { get; set; }
        public DbSet<UserType> UserType { get; set; }
    }
}
