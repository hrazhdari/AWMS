﻿using AWMS.core.Interfaces;
using AWMS.datalayer;
using AWMS.datalayer.Entities;
using AWMS.dto;

namespace AWMS.core
{
    public class CompanyService : ICompanyService
    {
        private readonly IUnitOfWork _unitOfWork;

        public CompanyService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<IEnumerable<Company>> GetAllCompaniesAsync()
        {
            return await _unitOfWork.Companies.GetAllAsync();
        }
        public IEnumerable<Company> GetAllCompanies()
        {
            return _unitOfWork.Companies.GetAll();
        }

        public Company GetCompanyByIdAsync(int id)
        {
            return _unitOfWork.Companies.GetByIdAsync(id);
        }

        public async Task<int> AddCompanyAsync(Company company)
        {
            await _unitOfWork.Companies.AddAsync(company);
            await _unitOfWork.CompleteAsync();
            return company.CompanyID;
        }

        public async Task UpdateCompanyAsync(Company company)
        {
            _unitOfWork.Companies.Update(company);
            await _unitOfWork.CompleteAsync();
        }

        public async Task DeleteCompanyAsync(int id)
        {
            var company = _unitOfWork.Companies.GetByIdAsync(id);
            if (company != null)
            {
                _unitOfWork.Companies.Delete(company);
                await _unitOfWork.CompleteAsync();
            }
        }

        public async Task<int?> GetByCompanyNameAsync(string Companyname)
        {
            return await _unitOfWork.Companies.GetByNameAsync(Companyname);
        }

        public Task<IEnumerable<CompaneisDto>> GetAllCompaniesNameAsync()
        {
            return _unitOfWork.Companies.GetAllCompanyNamesAsync();
        }
    }
}
