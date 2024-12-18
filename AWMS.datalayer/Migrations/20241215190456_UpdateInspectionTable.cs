using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AWMS.datalayer.Migrations
{
    /// <inheritdoc />
    public partial class UpdateInspectionTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Inspection",
                table: "Inspection");

            migrationBuilder.DropColumn(
                name: "InspectionId",
                table: "Inspection");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Inspection",
                table: "Inspection",
                column: "PLId");

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 15, 22, 34, 56, 68, DateTimeKind.Local).AddTicks(269));

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 15, 22, 34, 56, 68, DateTimeKind.Local).AddTicks(281));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 15, 22, 34, 56, 65, DateTimeKind.Local).AddTicks(7801));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 15, 22, 34, 56, 65, DateTimeKind.Local).AddTicks(7822));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 3,
                column: "EnteredDate",
                value: new DateTime(2024, 12, 15, 22, 34, 56, 65, DateTimeKind.Local).AddTicks(7823));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Inspection",
                table: "Inspection");

            migrationBuilder.AddColumn<int>(
                name: "InspectionId",
                table: "Inspection",
                type: "int",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Inspection",
                table: "Inspection",
                column: "InspectionId");

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
        }
    }
}
