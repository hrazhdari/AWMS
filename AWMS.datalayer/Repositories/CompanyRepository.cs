﻿using AWMS.datalayer.Context;
using AWMS.datalayer.Entities;
using AWMS.dto;
using Microsoft.EntityFrameworkCore;

namespace AWMS.datalayer.Repositories
{
    public class CompanyRepository : ICompanyRepository
    {
        private readonly AWMScontext _context;

        public CompanyRepository(AWMScontext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Company>> GetAllAsync()
        {
            return await _context.Companies.ToListAsync();
        }
        public IEnumerable<Company> GetAll()
        {
            return _context.Companies.ToList();
        }
        public Company GetByIdAsync(int id)
        {
            return _context.Companies.Find(id);
        }

        public void Update(Company company)
        {
            _context.Companies.Update(company);
            _context.SaveChanges();
        }

        public void Delete(Company company)
        {
            _context.Companies.Remove(company);
            _context.SaveChanges();
        }

        public async Task<int?> GetByNameAsync(string name)
        {
            return await _context.Companies
                      .Where(p => p.CompanyName.Contains(name))
                      .Select(p => (int?)p.CompanyID)
                      .FirstOrDefaultAsync();
        }

        public async Task<int> AddAsync(Company company)
        {
            await _context.Companies.AddAsync(company);
            await _context.SaveChangesAsync();
            return company.CompanyID;
        }

        public async Task<IEnumerable<CompaneisDto>> GetAllCompanyNamesAsync()
        {
            var companies = await _context.Companies
                .FromSqlRaw("EXEC sp_GetAllCompanyNames")
                .ToListAsync();  // واکشی اطلاعات به صورت async از دیتابیس

            // تبدیل داده‌ها به نوع CompaneisDto در سطح کلاینت
            var companyDtos = companies
                .Select(c => new CompaneisDto
                {
                    CompanyID = c.CompanyID,
                    CompanyName = c.CompanyName
                })
                .ToList();  // تبدیل به لیست همگام‌سازی شده

            return companyDtos;
        }

    }
}
