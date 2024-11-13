using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AWMS.datalayer.Migrations
{
    /// <inheritdoc />
    public partial class addFlagMIVorHMV_to_Locitem : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<byte>(
                name: "FlagMIVorHMV",
                table: "LocItems",
                type: "tinyint",
                nullable: true,
                comment: "Flag for MIV or HMV status");

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

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "FlagMIVorHMV",
                table: "LocItems");

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 10, 12, 15, 46, 19, 477, DateTimeKind.Local).AddTicks(7250));

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 10, 12, 15, 46, 19, 477, DateTimeKind.Local).AddTicks(7264));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 10, 12, 15, 46, 19, 476, DateTimeKind.Local).AddTicks(6066));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 10, 12, 15, 46, 19, 476, DateTimeKind.Local).AddTicks(6084));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 3,
                column: "EnteredDate",
                value: new DateTime(2024, 10, 12, 15, 46, 19, 476, DateTimeKind.Local).AddTicks(6086));
        }
    }
}
