using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AWMS.datalayer.Migrations
{
    /// <inheritdoc />
    public partial class AddInspectionTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Inspection",
                columns: table => new
                {
                    InspectionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PLId = table.Column<int>(type: "int", nullable: false),
                    IrnId = table.Column<int>(type: "int", nullable: false),
                    IRN_Conflict = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    IVR_NO = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    IVR_IFR = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    OrderStatus = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ThirdParty = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    OPI = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    Description = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: false),
                    IcNo = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    SubProject = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false),
                    Site = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    Laydown = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    Warehouse = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    OSBL = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    VisualInspection = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    QuantityCheck = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    Marking = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    Unloading = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    IVRPDF = table.Column<string>(type: "nvarchar(300)", maxLength: 300, nullable: false),
                    IFRPDF = table.Column<string>(type: "nvarchar(300)", maxLength: 300, nullable: false),
                    EnteredBy = table.Column<int>(type: "int", nullable: true),
                    EnteredDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    EditedBy = table.Column<int>(type: "int", nullable: true),
                    EditedDate = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Inspection", x => x.InspectionId);
                    table.ForeignKey(
                        name: "FK_Inspection_PackingLists_PLId",
                        column: x => x.PLId,
                        principalTable: "PackingLists",
                        principalColumn: "PLId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 15, 22, 16, 3, 823, DateTimeKind.Local).AddTicks(7689));

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 15, 22, 16, 3, 823, DateTimeKind.Local).AddTicks(7699));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 15, 22, 16, 3, 821, DateTimeKind.Local).AddTicks(8458));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 15, 22, 16, 3, 821, DateTimeKind.Local).AddTicks(8485));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 3,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 15, 22, 16, 3, 821, DateTimeKind.Local).AddTicks(8487));

            migrationBuilder.CreateIndex(
                name: "IX_Inspection_IrnId",
                table: "Inspection",
                column: "IrnId");

            migrationBuilder.CreateIndex(
                name: "IX_Inspection_IVR_NO",
                table: "Inspection",
                column: "IVR_NO");

            migrationBuilder.CreateIndex(
                name: "IX_Inspection_PLId",
                table: "Inspection",
                column: "PLId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Inspection");

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 11, 10, 17, 27, 35, 307, DateTimeKind.Local).AddTicks(6124));

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 11, 10, 17, 27, 35, 307, DateTimeKind.Local).AddTicks(6133));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 11, 10, 17, 27, 35, 306, DateTimeKind.Local).AddTicks(3303));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 11, 10, 17, 27, 35, 306, DateTimeKind.Local).AddTicks(3321));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 3,
                column: "EnteredDate",
                value: new DateTime(2024, 11, 10, 17, 27, 35, 306, DateTimeKind.Local).AddTicks(3322));
        }
    }
}
