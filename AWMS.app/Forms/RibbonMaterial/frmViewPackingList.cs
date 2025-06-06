﻿using AWMS.app.Forms.RibbonUser;
using AWMS.app.Utility;
using AWMS.core.Interfaces;
using AWMS.core.Services;
using AWMS.dapper.Repositories;
using AWMS.dto;
using DevExpress.XtraEditors;
using DevExpress.XtraEditors.Repository;
using DevExpress.XtraGrid;
using DevExpress.XtraGrid.Columns;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraGrid.Views.Grid.ViewInfo;
using Microsoft.Extensions.DependencyInjection;
using System.Diagnostics;

namespace AWMS.app.Forms.RibbonMaterial
{
    public partial class frmViewPackingList : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session;

        private bool _isAllSelected = false;
        int PLid;
        string PLname;

        public frmViewPackingList(
            ISupplierService supplierService, IServiceProvider serviceProvider,int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;

            int finalUserId = userId ?? 1; // استفاده از userId یا مقدار پیش‌فرض
            _session = SessionManager.GetSession(finalUserId);

            InitGrid();
            SetupImageListAndGridView();
            checkEdit3_CheckedChanged(null, null); // اگر چک‌باکس موجود است، به صورت خودکار تغییرات اعمال شود
        }

        private async void InitGrid()
        {
            try
            {
                var data = await _serviceProvider.GetService<IPackingListDapperRepository>()!.GetAllAsync();
                if (data != null && gridControl1 != null)
                {
                    gridControl1.DataSource = data;
                    gridView1.SortInfo.Clear();
                    gridView1.SortInfo.Add(new GridColumnSortInfo(gridView1.Columns["PLId"], DevExpress.Data.ColumnSortOrder.Descending));
                    if (gridView1.RowCount > 0) gridView1.FocusedRowHandle = 0;
                }
                else
                {
                    MessageBox.Show("No data retrieved from the database.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error loading data: {ex.Message}");
            }

            repositoryItemLookUpEditirn.DataSource = _serviceProvider.GetService<IIrnService>()!.GetAllIrns();
            repositoryItemLookUpEditshipment.DataSource = _serviceProvider.GetService<IShipmentService>()!.GetAllShipments();
            repositoryItemLookUpEditmr.DataSource = _serviceProvider.GetService<IMrService>()!.GetAllMrs();
            repositoryItemLookUpEditpo.DataSource = _serviceProvider.GetService<IPoService>()!.GetAllPos();
            repositoryItemLookUpEditarea.DataSource = _serviceProvider.GetService<IAreaUnitService>()!.GetAllAreaUnits();
            repositoryItemLookUpEditsupplier.DataSource = _serviceProvider.GetService<ISupplierService>()!.GetAllSuppliers();
            repositoryItemLookUpEditvendor.DataSource = _serviceProvider.GetService<IVendorService>()!.GetAllVendors();
            repositoryItemLookUpEditdescipline.DataSource = _serviceProvider.GetService<IDesciplineService>()!.GetAllDesciplines();
            repositoryItemLookUpEditdescriptionForPk.DataSource = _serviceProvider.GetService<IDescriptionForPkService>()!.GetAllDescriptionForPks();
            repositoryItemLookUpEditunit.DataSource = _serviceProvider.GetService<IUnitDapperRepository>()!.GetAll();
            repositoryItemLookUpEditscope.DataSource = _serviceProvider.GetService<IScopeDapperRepository>()!.GetAll();
            repositoryItemLookUpEditlocation.DataSource = await _serviceProvider.GetService<ILocationDapperRepository>()!.GetAllAsync();

        }

        private void SetupImageListAndGridView()
        {
            // ایجاد ImageList و افزودن آیکون‌ها
            ImageList imageList = new ImageList();
            //imageList.ImageSize = new Size(24, 24); // تغییر سایز آیکون به 32x32 (شما می‌توانید هر سایزی بگذارید)

            imageList.Images.Add(Image.FromFile("Resources/icons11_pdf.ico")); // آیکون برای فایل موجود
            imageList.Images.Add(Image.FromFile("Resources/icons10_pdf.ico")); // آیکون برای فایل ناموجود

            // ایجاد و تنظیم RepositoryItemImageEdit
            RepositoryItemImageEdit repositoryItemImageEdit = new RepositoryItemImageEdit();
            repositoryItemImageEdit.Images = imageList;

            // اختصاص RepositoryItemImageEdit به ستون PLDPF
            gridView1.Columns["PLDPF"].ColumnEdit = repositoryItemImageEdit;

            // غیرفعال کردن ویرایش برای ستون PLDPF
            gridView1.Columns["PLDPF"].OptionsColumn.AllowEdit = false; // یا به جای آن از ReadOnly استفاده کنید

            // تنظیم رویداد کلیک برای جلوگیری از هرگونه رفتار منوی پاپ‌آپ
            gridView1.RowCellClick += gridView1_RowCellClick;
        }

        private void gridView1_RowCellClick(object sender, DevExpress.XtraGrid.Views.Grid.RowCellClickEventArgs e)
        {
            if (e.Column.FieldName == "PLDPF")
            {
                e.Handled = true; // Stop event propagation

                string pdfPath = gridView1.GetRowCellValue(e.RowHandle, "PLDPF")?.ToString();

                try
                {
                    if (!string.IsNullOrEmpty(pdfPath) && System.IO.File.Exists(pdfPath))
                    {
                        var startInfo = new ProcessStartInfo
                        {
                            FileName = pdfPath,
                            UseShellExecute = true
                        };

                        Process.Start(startInfo);
                    }
                    else
                    {
                        MessageBox.Show(!string.IsNullOrEmpty(pdfPath) ? "PDF file does not exist." : "No PDF available for this row.");
                    }
                }
                catch (Exception ex)
                {
                    // Handle the exception
                    MessageBox.Show("An error occurred while trying to open the PDF file: " + ex.Message);
                }
            }
        }

        private void gridView1_CustomUnboundColumnData(object sender, DevExpress.XtraGrid.Views.Base.CustomColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "RowNumber" && e.IsGetData)
            {
                e.Value = e.ListSourceRowIndex + 1;
            }
        }






        private void gridView2_CustomUnboundColumnData(object sender, DevExpress.XtraGrid.Views.Base.CustomColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "RowNumber" && e.IsGetData)
            {
                e.Value = e.ListSourceRowIndex + 1;
            }
        }
        private void checkEdit2_CheckedChanged(object sender, EventArgs e)
        {
            if (checkEdit2.Checked) { gridView1.OptionsBehavior.ReadOnly = false; } else { gridView1.OptionsBehavior.ReadOnly = true; }
        }

        private void checkEdit1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkEdit1.Checked) { gridView1.OptionsBehavior.AllowDeleteRows = DevExpress.Utils.DefaultBoolean.False; } else { gridView1.OptionsBehavior.AllowDeleteRows = DevExpress.Utils.DefaultBoolean.True; }
        }

        private void gridView1_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {
            GridView view = sender as GridView;

            if (view != null && e.FocusedRowHandle >= 0)
            {
                // Assuming you have a property named PlName in your entity
                var plName = view.GetRowCellValue(e.FocusedRowHandle, "PLName");
                object plid = view.GetRowCellValue(e.FocusedRowHandle, "PLId");

                if (plName != null)
                {
                    // Set the font for the label if needed
                    labelControl3.Font = new Font("Tahoma", 9);
                    labelControl3.Text = $"Selected PlName: {plName.ToString()}";
                }

                int lastPK = _serviceProvider.GetService<IPackageDapperRepository>()!.GetLastPackage(Convert.ToInt32(plid.ToString()));
                int CountPK = _serviceProvider.GetService<IPackageDapperRepository>()!.GetPackageCount(Convert.ToInt32(plid.ToString()));
                lblcount.Text = "Count Of PK : " + CountPK;
                lblLastPK.Text = "Last PK : " + lastPK;
            }
        }


        private void btnAddIrn_Click(object sender, EventArgs e)
        {
            var frmIrn = _serviceProvider.GetRequiredService<Forms.frmSmall.frmIRN>();
            frmIrn.ShowDialog();
        }

        private void btnAddShipment_Click(object sender, EventArgs e)
        {
            var frmship = _serviceProvider.GetRequiredService<Forms.frmSmall.frmShipment>();
            frmship.ShowDialog();
        }

        private void btnAddSupplier_Click(object sender, EventArgs e)
        {
            var frmsupplier = _serviceProvider.GetRequiredService<Forms.frmSmall.frmSupplier>();
            frmsupplier.ShowDialog();
        }

        private void btnAddVendor_Click(object sender, EventArgs e)
        {
            var frmvendor = _serviceProvider.GetRequiredService<Forms.frmSmall.frmVendor>();
            frmvendor.ShowDialog();
        }

        private void btnRefreshArchiveNO_Click(object sender, EventArgs e)
        {
            InitGrid();
            XtraMessageBox.Show("All Data Refreshed ;)");
        }

        private async void gridView1_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            try
            {
                GridView view = sender as GridView;

                // Check if the modified row is not a new row
                if (e.RowHandle >= 0)
                {
                    PackingListDto modifiedPackingList = view.GetRow(e.RowHandle) as PackingListDto;

                    if (modifiedPackingList != null)
                    {
                        try
                        {
                            // Update the entity using the repository method
                            var (success, errorMessage) = await _serviceProvider.GetService<IPackingListDapperRepository>()!.UpdateAsync(modifiedPackingList);

                            if (!success)
                            {
                                // Handle the case where the update was not successful
                                MessageBox.Show($"Failed to update PackingList. {errorMessage}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            }
                            else
                            {
                                // Update was successful
                                MessageBox.Show("PackingList updated successfully.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            }
                        }
                        catch (Exception ex)
                        {
                            // Handle or log the exception as needed
                            MessageBox.Show($"An error occurred while updating PackingList: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle or log the exception as needed
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        //private async void gridControl1_DoubleClick(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        GridControl gridControl = sender as GridControl;

        //        if (gridControl != null && gridView1 != null)
        //        {
        //            GridHitInfo hitInfo = gridView1.CalcHitInfo(gridControl.PointToClient(Control.MousePosition));

        //            if (hitInfo != null && hitInfo.RowHandle >= 0)
        //            {
        //                if (hitInfo.RowHandle < gridView1.RowCount)
        //                {
        //                    object plIdObject = gridView1.GetRowCellValue(hitInfo.RowHandle, "PLId");
        //                    if (plIdObject != null && plIdObject is int)
        //                    {
        //                        PLid = (int)plIdObject;
        //                        PLname = gridView1.GetRowCellValue(hitInfo.RowHandle, "PLName")?.ToString();

        //                        // اطمینان حاصل کنید که _packingRepository مقداردهی شده است
        //                        if (_serviceProvider.GetService<IPackingListDapperRepository>() != null)
        //                        {
        //                            gridControl2.DataSource = await _serviceProvider.GetService<IPackingListDapperRepository>().AllItemSelectedPlAsync(PLid);
        //                        }

        //                        if (xtraTabControl1 != null)
        //                        {
        //                            if (xtraTabPage2 != null)
        //                            {
        //                                xtraTabControl1.SelectedTabPage = xtraTabPage2;
        //                            }
        //                            else
        //                            {
        //                                MessageBox.Show("xtraTabPage2 مقداردهی اولیه نشده است.");
        //                            }
        //                        }
        //                        else
        //                        {
        //                            MessageBox.Show("xtraTabControl1 مقداردهی اولیه نشده است.");
        //                        }

        //                        labelControl8.Text = "PLID:  " + PLid.ToString();
        //                        labelControl9.Text = "PLName:  " + PLname;

        //                        // اطمینان حاصل کنید که _packageRepository مقداردهی شده است
        //                        if (_serviceProvider.GetService<IPackageDapperRepository>() != null)
        //                        {
        //                            repositoryItemLookUpEditpk.DataSource = _serviceProvider.GetService<IPackageDapperRepository>()!.GetPackageByPLId(PLid);
        //                        }

        //                        gridView2.SortInfo.Clear();
        //                        gridView2.SortInfo.Add(new GridColumnSortInfo(gridView1.Columns["LocItemID"], DevExpress.Data.ColumnSortOrder.Descending));

        //                        if (gridView2.RowCount > 0)
        //                        {
        //                            gridView2.FocusedRowHandle = 0;
        //                        }

        //                        _isAllSelected = false;
        //                        btnSelectAll.Text = "Select All";
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // ثبت یا مدیریت استثنا
        //        MessageBox.Show($"خطا رخ داده است: {ex.Message}");
        //    }
        //}
        private async void gridControl1_DoubleClick(object sender, EventArgs e)
        {
            try
            {
                // چک کردن اعتبار gridControl و gridView
                if (sender is GridControl gridControl && gridView1 != null)
                {
                    // محاسبه مکان کلیک
                    GridHitInfo hitInfo = gridView1.CalcHitInfo(gridControl.PointToClient(Control.MousePosition));

                    if (hitInfo?.RowHandle >= 0 && hitInfo.RowHandle < gridView1.RowCount)
                    {
                        // استخراج اطلاعات PLId و PLName
                        object plIdObject = gridView1.GetRowCellValue(hitInfo.RowHandle, "PLId");
                        string plNameObject = gridView1.GetRowCellValue(hitInfo.RowHandle, "PLName")?.ToString();

                        if (plIdObject is int plId && !string.IsNullOrEmpty(plNameObject))
                        {
                            PLid = plId;
                            PLname = plNameObject;

                            var packingRepo = _serviceProvider.GetService<IPackingListDapperRepository>();
                            var packageRepo = _serviceProvider.GetService<IPackageDapperRepository>();

                            if (packingRepo != null)
                            {
                                // بارگذاری داده‌های gridControl2
                                var itemsTask = packingRepo.AllItemSelectedPlAsync(PLid);
                                gridControl2.DataSource = await itemsTask;
                            }

                            if (xtraTabControl1 != null && xtraTabPage2 != null)
                            {
                                xtraTabControl1.SelectedTabPage = xtraTabPage2;
                            }

                            labelControl8.Text = $"PLID: {PLid}";
                            labelControl9.Text = $"PLName: {PLname}";

                            if (packageRepo != null)
                            {
                                // بارگذاری داده‌های RepositoryItemLookUpEdit
                                var packagesTask = Task.Run(() => packageRepo.GetPackageByPLId(PLid));
                                repositoryItemLookUpEditpk.DataSource = await packagesTask;
                            }

                            // تنظیم مرتب‌سازی
                            gridView2.SortInfo.Clear();
                            gridView2.SortInfo.Add(new GridColumnSortInfo(gridView1.Columns["LocItemID"], DevExpress.Data.ColumnSortOrder.Descending));

                            // تنظیم فوکوس
                            if (gridView2.RowCount > 0)
                            {
                                gridView2.FocusedRowHandle = 0;
                            }

                            // بازنشانی وضعیت Select All
                            _isAllSelected = false;
                            btnSelectAll.Text = "Select All";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // ثبت یا مدیریت استثنا
                MessageBox.Show($"خطا رخ داده است: {ex.Message}");
            }
        }


        private bool updatingQtyInLoc = false;

        private void gridView2_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            GridView view = sender as GridView;

            if (e.Column.FieldName == "LocationID" && e.RowHandle >= 0)
            {
                object newLocationValue = e.Value;
                int[] selectedRows = view.GetSelectedRows();

                view.CellValueChanged -= gridView2_CellValueChanged;

                List<UpdateLocitemLocationDto> updateDtos = new List<UpdateLocitemLocationDto>();

                foreach (int rowHandle in selectedRows)
                {
                    view.SetRowCellValue(rowHandle, "LocationID", newLocationValue);

                    object locItemId = gridView2.GetRowCellValue(rowHandle, "LocItemID");

                    if (locItemId != null)
                    {
                        int locItemIdValue = Convert.ToInt32(locItemId);
                        int locationIdValue = Convert.ToInt32(newLocationValue);

                        var updateDto = new UpdateLocitemLocationDto
                        {
                            LocItemID = locItemIdValue,
                            LocationID = locationIdValue,
                            EditedBy = _session.UserID, // Replace with the actual current user
                            EditedDate = DateTime.Now
                        };

                        updateDtos.Add(updateDto);
                    }
                    else
                    {
                        XtraMessageBox.Show($"LocItemID is null for row handle {rowHandle}.");
                    }
                }

                view.CellValueChanged += gridView2_CellValueChanged;

                UpdateLocationsInDatabase(updateDtos);
            }
            if (!updatingQtyInLoc && (e.Column.FieldName == "OverQty" || e.Column.FieldName == "ShortageQty" || e.Column.FieldName == "Qty"))
            {
                try
                {
                    updatingQtyInLoc = true;
                    UpdateQtyinloc(e);
                }
                finally
                {
                    updatingQtyInLoc = false;
                }
            }
            if (e.Column.FieldName != "StorageCode")
            {
                object LocItemObj = gridView2.GetRowCellValue(gridView2.FocusedRowHandle, "LocItemID");
                object ItemIdObj = gridView2.GetRowCellValue(gridView2.FocusedRowHandle, "ItemId");
                object PKIDObj = gridView2.GetRowCellValue(gridView2.FocusedRowHandle, "PKID");
                UpdateDatabase(Convert.ToInt32(LocItemObj), Convert.ToInt32(ItemIdObj), Convert.ToInt32(PKIDObj));
            }
        }

        private async void UpdateLocationsInDatabase(List<UpdateLocitemLocationDto> updateDtos)
        {
            try
            {
                await _serviceProvider.GetService<ILocItemDapperRepository>()!.UpdateLocationsAsync(updateDtos);
                gridView2.RefreshData();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show($"Error occurred: {ex.Message}");
            }
        }

        private async void UpdateDatabase(int locitem, int itemid, int PKID)
        {
            int entityId = locitem;
            int itemId = itemid;
            int pkId = PKID;
            int focusedRowHandle = gridView2.FocusedRowHandle;

            try
            {
                // گرفتن شی از متدل
                var entityToUpdate = await _serviceProvider.GetService<ILocItemDapperRepository>()!.GetByIdAsync(entityId);

                // بررسی وجود شی
                if (entityToUpdate != null)
                {
                    // به‌روزرسانی ویژگی‌های شی با مقادیر تغییر یافته
                    entityToUpdate.OverQty = GetCellValue<decimal>(focusedRowHandle, "OverQty", gridView2);
                    entityToUpdate.ShortageQty = GetCellValue<decimal>(focusedRowHandle, "ShortageQty", gridView2);
                    entityToUpdate.Qty = GetCellValue<decimal>(focusedRowHandle, "Qty", gridView2);
                    entityToUpdate.DamageQty = GetCellValue<decimal>(focusedRowHandle, "DamageQty", gridView2);
                    entityToUpdate.RejectQty = GetCellValue<decimal>(focusedRowHandle, "RejectQty", gridView2);
                    entityToUpdate.NISQty = GetCellValue<decimal>(focusedRowHandle, "NISQty", gridView2);
                    entityToUpdate.LocationID = GetCellValue<int>(focusedRowHandle, "LocationID", gridView2);

                    // به‌روزرسانی ویژگی‌های ویرایش
                    entityToUpdate.EditedBy = _session.UserID; // فرض می‌کنیم متغیری به نام currentUser دارید که کاربر جاری را نگه می‌دارد
                    entityToUpdate.EditedDate = DateTime.Now;

                    // فراخوانی متد به‌روزرسانی برای ذخیره تغییرات
                    await _serviceProvider.GetService<ILocItemDapperRepository>()!.UpdateAsync(entityToUpdate);
                }
                else
                {
                    XtraMessageBox.Show("Warning!!! Entity (LocItem) not found. A problem has occurred.");
                }
            }
            catch (Exception ex)
            {
                // Log or display the exception details for debugging
                XtraMessageBox.Show($"Error occurred: {ex.Message}" + "LocItem Section");
            }

            try
            {
                // گرفتن شی از متدل
                var entityItemToUpdate = await _serviceProvider.GetService<IItemDapperRepository>()!.GetByIdAsync(itemid);

                // بررسی وجود شی
                if (entityItemToUpdate != null)
                {
                    // به‌روزرسانی ویژگی‌های شی با مقادیر تغییر یافته
                    entityItemToUpdate.ItemOfPk = GetCellValue<int?>(focusedRowHandle, "ItemOfPk", gridView2).GetValueOrDefault(0);
                    entityItemToUpdate.PKID = GetCellValue<int?>(focusedRowHandle, "PKID", gridView2).GetValueOrDefault(0);
                    entityItemToUpdate.NetW = GetCellValue<decimal?>(focusedRowHandle, "NetW", gridView2).GetValueOrDefault(0.00m);
                    entityItemToUpdate.GrossW = GetCellValue<decimal?>(focusedRowHandle, "GrossW", gridView2).GetValueOrDefault(0.00m);
                    entityItemToUpdate.IncorectQty = GetCellValue<decimal?>(focusedRowHandle, "IncorectQty", gridView2).GetValueOrDefault(0.00m);

                    entityItemToUpdate.Tag = GetCellValue<string>(focusedRowHandle, "Tag", gridView2) ?? string.Empty;
                    entityItemToUpdate.Description = GetCellValue<string>(focusedRowHandle, "Description", gridView2) ?? string.Empty;
                    entityItemToUpdate.UnitID = GetCellValue<int?>(focusedRowHandle, "UnitID", gridView2).GetValueOrDefault(1);
                    entityItemToUpdate.Qty = GetCellValue<decimal?>(focusedRowHandle, "QtyPL", gridView2).GetValueOrDefault(0.00m);
                    entityItemToUpdate.OverQty = GetCellValue<decimal?>(focusedRowHandle, "OverQtyPL", gridView2).GetValueOrDefault(0.00m);
                    entityItemToUpdate.ShortageQty = GetCellValue<decimal?>(focusedRowHandle, "ShortageQtyPL", gridView2).GetValueOrDefault(0.00m);
                    entityItemToUpdate.DamageQty = GetCellValue<decimal?>(focusedRowHandle, "DamageQtyPL", gridView2).GetValueOrDefault(0.00m);
                    entityItemToUpdate.ScopeID = GetCellValue<int?>(focusedRowHandle, "ScopeID", gridView2).GetValueOrDefault(1);
                    entityItemToUpdate.HeatNo = GetCellValue<string>(focusedRowHandle, "HeatNo", gridView2) ?? string.Empty;
                    entityItemToUpdate.BatchNo = GetCellValue<string>(focusedRowHandle, "BatchNo", gridView2) ?? string.Empty;
                    entityItemToUpdate.Remark = GetCellValue<string>(focusedRowHandle, "Remark", gridView2) ?? string.Empty;
                    entityItemToUpdate.NIS = GetCellValue<decimal?>(focusedRowHandle, "NIS", gridView2).GetValueOrDefault(0.00m);
                    //entityItemToUpdate.Hold = GetCellValue<bool?>(focusedRowHandle, "Hold", gridView2);
                    //var holdValue = GetCellValue<bool?>(focusedRowHandle, "Hold", gridView2);
                    //entityItemToUpdate.Hold = holdValue.HasValue ? holdValue.Value : (bool?)null;
                    entityItemToUpdate.Hold = gridView2.GetRowCellValue(focusedRowHandle, "Hold") as bool? ?? false;


                    // به‌روزرسانی ویژگی‌های ویرایش
                    entityItemToUpdate.EditedBy = _session.UserID; // فرض می‌کنیم متغیری به نام currentUser دارید که کاربر جاری را نگه می‌دارد
                    entityItemToUpdate.EditedDate = DateTime.Now;

                    // فراخوانی متد به‌روزرسانی برای ذخیره تغییرات
                    await _serviceProvider.GetService<IItemDapperRepository>()!.UpdateAsync(entityItemToUpdate);
                }
                else
                {
                    XtraMessageBox.Show("Warning!!! Entity (ItemId) not found. A problem has occurred.");
                }
            }
            catch (Exception ex)
            {
                // Log or display the exception details for debugging
                XtraMessageBox.Show($"Error occurred: {ex.Message}" + "ITEM Section");
                // در اینجا می‌توانید خطاها را لاگ کنید
                // Logger.LogError(ex, "An error occurred while updating the entity.");
            }

            try
            {
                // گرفتن شی از متدل
                var entityToUpdate = _serviceProvider.GetService<IPackageDapperRepository>()!.GetPackageById(pkId);

                // بررسی وجود شی
                if (entityToUpdate != null)
                {
                    // به‌روزرسانی ویژگی‌های شی با مقادیر تغییر یافته
                    entityToUpdate.ArrivalDate = GetCellValue<DateTime?>(focusedRowHandle, "ArrivalDate", gridView2);
                    entityToUpdate.MSRNO = GetCellValue<string>(focusedRowHandle, "MSRNO", gridView2);
                    entityToUpdate.MSRPDF = GetCellValue<string>(focusedRowHandle, "MSRPDF", gridView2);

                    // به‌روزرسانی ویژگی‌های ویرایش
                    entityToUpdate.EditedBy = _session.UserID; // فرض می‌کنیم متغیری به نام currentUser دارید که کاربر جاری را نگه می‌دارد
                    entityToUpdate.EditedDate = DateTime.Now;

                    // ساخت DTO برای به‌روزرسانی
                    var updatedPackage = new UpdatePackageDto
                    {
                        PKID = entityToUpdate.PKID,
                        ArrivalDate = entityToUpdate.ArrivalDate,
                        MSRNO = entityToUpdate.MSRNO,
                        MSRPDF = entityToUpdate.MSRPDF,
                        EditedBy = entityToUpdate.EditedBy,
                        EditedDate = entityToUpdate.EditedDate
                    };

                    // فراخوانی متد به‌روزرسانی برای ذخیره تغییرات
                    var updateResult = _serviceProvider.GetService<IPackageDapperRepository>()!.UpdatePackage(pkId, updatedPackage);

                    if (!updateResult)
                    {
                        XtraMessageBox.Show("Warning!!! Update failed. A problem has occurred.");
                    }
                }
                else
                {
                    XtraMessageBox.Show("Warning!!! Entity (PKID) not found. A problem has occurred.");
                }
            }
            catch (Exception ex)
            {
                // Log or display the exception details for debugging
                XtraMessageBox.Show($"Error occurred: {ex.Message}" + "PK Section");
            }
        }

        private T GetCellValue<T>(int focusedRowHandle, string columnName, GridView gridView)
        {
            object value = gridView.GetRowCellValue(focusedRowHandle, columnName);

            if (value == DBNull.Value)
            {
                return default(T);
            }

            try
            {
                if (typeof(T) == typeof(decimal?))
                {
                    return (T)(object)(value is decimal decimalValue ? (decimal?)decimalValue : null);
                }
                if (typeof(T) == typeof(decimal))
                {
                    return (T)(object)(value is decimal decimalValue ? decimalValue : 0m);
                }
                if (typeof(T) == typeof(int?))
                {
                    return (T)(object)(value is int intValue ? (int?)intValue : null);
                }
                if (typeof(T) == typeof(int))
                {
                    return (T)(object)(value is int intValue ? intValue : 0);
                }
                if (typeof(T) == typeof(string))
                {
                    return (T)value;
                }

                return (T)Convert.ChangeType(value, typeof(T));
            }
            catch (InvalidCastException)
            {
                // برای رفع خطا، می‌توانید پیغام خطا ثبت کنید یا مقدار پیش‌فرض برگردانید
                return default(T);
            }
        }


        private void UpdateQtyinloc(DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            int focusedRowHandle = gridView2.FocusedRowHandle;

            if (focusedRowHandle >= 0 && focusedRowHandle < gridView2.DataRowCount)
            {
                object overQtyObj = gridView2.GetRowCellValue(focusedRowHandle, "OverQty");
                object overObj = gridView2.GetRowCellValue(focusedRowHandle, "OverQty");
                object shortageQtyObj = gridView2.GetRowCellValue(focusedRowHandle, "ShortageQty");
                object shortageObj = gridView2.GetRowCellValue(focusedRowHandle, "ShortageQty");
                object qtyInLocObj = gridView2.GetRowCellValue(focusedRowHandle, "Qty");

                int newoverQty = overQtyObj != DBNull.Value && overQtyObj != null ? Convert.ToInt32(overQtyObj) : 0;
                int overQty = overQtyObj != DBNull.Value && overQtyObj != null ? Convert.ToInt32(overObj) : 0;
                int newshortageQty = shortageQtyObj != DBNull.Value && shortageQtyObj != null ? Convert.ToInt32(shortageQtyObj) : 0;
                int shortageQty = shortageQtyObj != DBNull.Value && shortageQtyObj != null ? Convert.ToInt32(shortageObj) : 0;
                int newqtyInLoc = qtyInLocObj != DBNull.Value && qtyInLocObj != null ? Convert.ToInt32(qtyInLocObj) : 0;


                int oldoverQty = e.OldValue != DBNull.Value && e.OldValue != null ? Convert.ToInt32(e.OldValue) : 0;
                int oldshortageQty = e.OldValue != DBNull.Value && e.OldValue != null ? Convert.ToInt32(e.OldValue) : 0;
                int newQty = 0;
                if (e.Column.FieldName == "Qty")
                {
                    // User directly changed "Qtyinloc"
                    newQty = (newqtyInLoc + newoverQty) - newshortageQty;
                    //MessageBox.Show("direct change: " + newQty);
                }
                else if (e.Column.FieldName == "OverQty" && newoverQty - oldoverQty != 0)
                {
                    newQty = (newqtyInLoc - oldoverQty) + newoverQty;
                    //MessageBox.Show("over : " + newQty);
                    newqtyInLoc = newQty;
                }
                else if (e.Column.FieldName == "ShortageQty" && newshortageQty - oldshortageQty != 0)
                {
                    newQty = (newqtyInLoc + oldshortageQty) - newshortageQty;
                    //MessageBox.Show("shortage : " + newQty);
                    newqtyInLoc = newQty;
                }

                gridView2.SetRowCellValue(focusedRowHandle, "Qty", newQty);

                if (newoverQty != overQty)
                {
                    MessageBox.Show("Check the Over Qty: OverQtyloc is different from OverQty");
                }
                if (newshortageQty != shortageQty)
                {
                    MessageBox.Show("Check the Shortage Qty: ShortageQtyloc is different from ShortageQty");
                }
            }
        }

        private async void simpleButton7_Click(object sender, EventArgs e)
        {
            gridControl2.DataSource = await _serviceProvider.GetService<IPackingListDapperRepository>()!.AllItemSelectedPlAsync(PLid);
            repositoryItemLookUpEditpk.DataSource = _serviceProvider.GetService<IPackageDapperRepository>()!.GetPackageByPLId(PLid);
            _isAllSelected = false;
            btnSelectAll.Text = "Select All";
            XtraMessageBox.Show("All Data Refreshed ;)", "Success Refresh", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void labelControl7_Click(object sender, EventArgs e)
        {
            simpleButton7_Click(null, null);
        }

        private void labelControl4_Click(object sender, EventArgs e)
        {
            btnRefreshArchiveNO_Click(null, null);
        }

        private async void comboBoxEdit1_EditValueChanged(object sender, EventArgs e)
        {
            ComboBoxEdit comboBoxEdit = sender as ComboBoxEdit;
            GridView view = gridView2; // Set to your GridView

            if (comboBoxEdit != null && view != null)
            {
                // Get the new storage value
                string newStorageValue = comboBoxEdit.EditValue?.ToString();

                if (!string.IsNullOrEmpty(newStorageValue))
                {
                    // Get all item IDs from selected rows
                    int[] selectedRows = view.GetSelectedRows();
                    List<int> itemIds = new List<int>();

                    foreach (int rowHandle in selectedRows)
                    {
                        object itemIdObj = view.GetRowCellValue(rowHandle, "ItemId");
                        if (itemIdObj != null && int.TryParse(itemIdObj.ToString(), out int itemId))
                        {
                            itemIds.Add(itemId);
                        }
                    }

                    // Apply the new storage value to all selected rows
                    if (itemIds.Count > 0)
                    {
                        try
                        {
                            await _serviceProvider.GetService<IItemDapperRepository>()!.UpdateStorageCodesAsync(itemIds, newStorageValue);

                            // Update the grid view
                            view.BeginDataUpdate();
                            try
                            {
                                foreach (int rowHandle in selectedRows)
                                {
                                    view.SetRowCellValue(rowHandle, "StorageCode", newStorageValue);
                                }
                            }
                            finally
                            {
                                view.EndDataUpdate();
                            }
                        }
                        catch (Exception ex)
                        {
                            XtraMessageBox.Show($"An error occurred while updating storage codes: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
        }

        private void btnSelectAll_Click(object sender, EventArgs e)
        {
            gridView2.BeginUpdate();
            try
            {
                if (_isAllSelected)
                {
                    // لغو انتخاب همه ردیف‌ها
                    gridView2.ClearSelection();
                    // تغییر متن دکمه به "Select All"
                    btnSelectAll.Text = "Select All";
                }
                else
                {
                    // انتخاب همه ردیف‌ها
                    gridView2.SelectAll();
                    // تغییر متن دکمه به "Unselect All"
                    btnSelectAll.Text = "Unselect All";
                }
                // به‌روزرسانی وضعیت انتخاب
                _isAllSelected = !_isAllSelected;
            }
            finally
            {
                gridView2.EndUpdate();
            }
        }

        private void btnHoldAll_Click(object sender, EventArgs e)
        {
            //    gridView2.BeginUpdate();
            //    try
            //    {
            //        if (_isAllHoldSelected)
            //        {
            //            // لغو انتخاب همه ردیف‌ها
            //            for (int i = 0; i < gridView2.RowCount; i++)
            //            {
            //                gridView2.SetRowCellValue(i, "Hold", false);
            //            }
            //            // تغییر متن دکمه به "Select All"
            //            btnHoldAll.Text = "Hold All";
            //        }
            //        else
            //        {
            //            // انتخاب همه ردیف‌ها
            //            for (int i = 0; i < gridView2.RowCount; i++)
            //            {
            //                gridView2.SetRowCellValue(i, "Hold", true);
            //            }
            //            // تغییر متن دکمه به "Unselect All"
            //            btnHoldAll.Text = "UnHold All";
            //        }
            //        // به‌روزرسانی وضعیت انتخاب
            //        _isAllHoldSelected = !_isAllSelected;
            //    }
            //    finally
            //    {
            //        gridView2.EndUpdate();
            //    }

        }

        private void gridControl2_Click(object sender, EventArgs e)
        {

        }

        private void simpleButton6_Click(object sender, EventArgs e)
        {
            //using (SaveFileDialog sfd = new SaveFileDialog() { Filter = "Excel Workbook|*.xlsx", FileName = "ViewPackingExcelOutPut.xlsx" })
            //{
            //    if (sfd.ShowDialog() == DialogResult.OK)
            //    {
            //        ExportFromGridViewDevexpress.ExportToExcel(gridView2, sfd.FileName); // فرض می‌کنیم gridView1 نام GridView DevExpress شماست
            //    }
            //}


            ExportFromGridViewDevexpress.SaveGridData("Excel Files|*.xlsx", "Save Excel File", fileName => gridView2.ExportToXlsx(fileName));

        }

        private void checkEdit3_CheckedChanged(object sender, EventArgs e)
        {
            gridView2.OptionsBehavior.ReadOnly = !checkEdit3.Checked;
            //if (checkEdit2.Checked) { gridView1.OptionsBehavior.ReadOnly = false; } else { gridView1.OptionsBehavior.ReadOnly = true; }

        }


    }
}










