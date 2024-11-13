using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AWMS.datalayer.Migrations
{
    /// <inheritdoc />
    public partial class addPLocitemidIDforMRV : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "PLocItemIDforMRV",
                table: "Requests",
                type: "int",
                nullable: true,
                comment: "Parent LocItemID for MRV process");

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

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PLocItemIDforMRV",
                table: "Requests");

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 11, 10, 15, 22, 32, 464, DateTimeKind.Local).AddTicks(8143));

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 11, 10, 15, 22, 32, 464, DateTimeKind.Local).AddTicks(8176));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 11, 10, 15, 22, 32, 461, DateTimeKind.Local).AddTicks(4727));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 11, 10, 15, 22, 32, 461, DateTimeKind.Local).AddTicks(4778));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 3,
                column: "EnteredDate",
                value: new DateTime(2024, 11, 10, 15, 22, 32, 461, DateTimeKind.Local).AddTicks(4780));
        }
    }
}
