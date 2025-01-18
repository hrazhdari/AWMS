using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AWMS.datalayer.Migrations
{
    /// <inheritdoc />
    public partial class MrcTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Mrcs",
                columns: table => new
                {
                    MrcId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ToCompanyID = table.Column<int>(type: "int", nullable: false),
                    MrcName = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    MrcDescription = table.Column<string>(type: "nvarchar(1000)", maxLength: 1000, nullable: true),
                    PK = table.Column<int>(type: "int", nullable: true),
                    ItemOfPk = table.Column<int>(type: "int", nullable: true),
                    Tag = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    Description = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    UnitID = table.Column<int>(type: "int", nullable: false),
                    Qty = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    Size1 = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Size2 = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    BatchNo = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    DocNo = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    Remark = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    EnteredBy = table.Column<int>(type: "int", nullable: true),
                    EnteredDate = table.Column<DateTime>(type: "date", nullable: true),
                    EditedBy = table.Column<int>(type: "int", nullable: true),
                    EditedDate = table.Column<DateTime>(type: "date", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Mrcs", x => x.MrcId);
                    table.ForeignKey(
                        name: "FK_Mrc_Company",
                        column: x => x.ToCompanyID,
                        principalTable: "Companies",
                        principalColumn: "CompanyID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Mrc_Unit",
                        column: x => x.UnitID,
                        principalTable: "Units",
                        principalColumn: "UnitID",
                        onDelete: ReferentialAction.Restrict);
                });

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

            migrationBuilder.CreateIndex(
                name: "IX_Item_ToCompanyID",
                table: "Mrcs",
                column: "ToCompanyID");

            migrationBuilder.CreateIndex(
                name: "IX_Item_UnitID",
                table: "Mrcs",
                column: "UnitID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Mrcs");

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 16, 21, 49, 18, 799, DateTimeKind.Local).AddTicks(6893));

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 16, 21, 49, 18, 799, DateTimeKind.Local).AddTicks(6906));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 16, 21, 49, 18, 797, DateTimeKind.Local).AddTicks(6094));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 16, 21, 49, 18, 797, DateTimeKind.Local).AddTicks(6115));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 3,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 16, 21, 49, 18, 797, DateTimeKind.Local).AddTicks(6116));
        }
    }
}
