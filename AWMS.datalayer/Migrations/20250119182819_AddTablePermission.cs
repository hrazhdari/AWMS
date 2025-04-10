using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace AWMS.datalayer.Migrations
{
    /// <inheritdoc />
    public partial class AddTablePermission : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ApplicationPermissions",
                columns: table => new
                {
                    PermissionID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleID = table.Column<int>(type: "int", nullable: false),
                    RibbonPageName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    IsEnabled = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ApplicationPermissions", x => x.PermissionID);
                    table.ForeignKey(
                        name: "FK_ApplicationPermissions_ApplicationRole_RoleID",
                        column: x => x.RoleID,
                        principalTable: "ApplicationRole",
                        principalColumn: "RoleID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.InsertData(
                table: "ApplicationPermissions",
                columns: new[] { "PermissionID", "IsEnabled", "RibbonPageName", "RoleID" },
                values: new object[,]
                {
                    { 1, true, "ribbonPage1", 1 },
                    { 2, true, "ribbonPage2", 1 },
                    { 3, true, "ribbonPage3", 1 },
                    { 4, true, "ribbonPage4", 1 },
                    { 5, true, "ribbonPage5", 1 },
                    { 6, true, "ribbonPage6", 1 },
                    { 7, true, "ribbonPage7", 1 },
                    { 8, true, "ribbonPage8", 1 },
                    { 9, true, "ribbonPage9", 1 },
                    { 10, true, "ribbonPage10", 1 },
                    { 11, true, "ribbonPage11", 1 },
                    { 12, true, "ribbonPage12", 1 },
                    { 13, true, "ribbonPage13", 1 },
                    { 14, true, "ribbonPage14", 1 },
                    { 15, true, "ribbonPage15", 1 },
                    { 16, true, "ribbonPage16", 1 },
                    { 17, true, "ribbonPage17", 1 },
                    { 18, true, "ribbonPage18", 1 }
                });

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2025, 1, 19, 21, 58, 19, 371, DateTimeKind.Local).AddTicks(1180));

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2025, 1, 19, 21, 58, 19, 371, DateTimeKind.Local).AddTicks(1198));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2025, 1, 19, 21, 58, 19, 367, DateTimeKind.Local).AddTicks(5266));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2025, 1, 19, 21, 58, 19, 367, DateTimeKind.Local).AddTicks(5286));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 3,
                column: "EnteredDate",
                value: new DateTime(2025, 1, 19, 21, 58, 19, 367, DateTimeKind.Local).AddTicks(5288));

            migrationBuilder.CreateIndex(
                name: "IX_ApplicationPermissions_RoleID",
                table: "ApplicationPermissions",
                column: "RoleID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ApplicationPermissions");

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2025, 1, 15, 21, 56, 26, 547, DateTimeKind.Local).AddTicks(9188));

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2025, 1, 15, 21, 56, 26, 547, DateTimeKind.Local).AddTicks(9201));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2025, 1, 15, 21, 56, 26, 545, DateTimeKind.Local).AddTicks(6393));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2025, 1, 15, 21, 56, 26, 545, DateTimeKind.Local).AddTicks(6411));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 3,
                column: "EnteredDate",
                value: new DateTime(2025, 1, 15, 21, 56, 26, 545, DateTimeKind.Local).AddTicks(6412));
        }
    }
}
