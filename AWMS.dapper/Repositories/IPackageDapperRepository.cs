﻿using AWMS.dto;

namespace AWMS.dapper.Repositories
{
    public interface IPackageDapperRepository
    {
        bool AddPackage(PackageDto package);
        bool DeletePackage(int packageId);
        IEnumerable<PackageDto> GetAllPackage();
        Task<IEnumerable<PackageDto>> GetAllPackageAsync();
        PackageDto GetPackageById(int packageId);
        IEnumerable<PackageDto> GetPackageByPLId(int plId);
        void AddPackages(IEnumerable<PackageDto> packages);
        PackageDto GetPackageByPK(int pk);
        bool GetPackageByPackageNameBool(string packageName);
        int GetLastPackage(int plId);
        int GetLastPKID(int plId);
        int? GetPackageByPKID(int packageId);
        int GetPackageCount(int plId);
        bool CheckPkExist(int plId, int pkNumber);
        int GetPkId(int plId, int pkNumber);
        //bool UpdatePackage(int packageId, PackageDto updatedPackage);
        bool UpdatePackagePulse(int packageId, UpdatePkDto updatedPackage);
        bool UpdatePackage(int packageId, UpdatePackageDto updatedPackage);
        Task DeleteMultiplePKsWithTransactionAsync(IEnumerable<PackagePKIDDto> PKIDs);
    }
}