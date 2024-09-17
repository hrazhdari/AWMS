using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AWMS.datalayer.Migrations
{
    /// <inheritdoc />
    public partial class LocationWarehouse : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "LocationWarehouse",
                table: "Locations",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 9, 11, 16, 25, 16, 660, DateTimeKind.Local).AddTicks(242));

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 9, 11, 16, 25, 16, 660, DateTimeKind.Local).AddTicks(261));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 1,
                columns: new[] { "EnteredDate", "LocationWarehouse" },
                values: new object[] { new DateTime(2024, 9, 11, 16, 25, 16, 658, DateTimeKind.Local).AddTicks(5764), null });

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 2,
                columns: new[] { "EnteredDate", "LocationWarehouse" },
                values: new object[] { new DateTime(2024, 9, 11, 16, 25, 16, 658, DateTimeKind.Local).AddTicks(5782), null });

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 3,
                columns: new[] { "EnteredDate", "LocationWarehouse" },
                values: new object[] { new DateTime(2024, 9, 11, 16, 25, 16, 658, DateTimeKind.Local).AddTicks(5784), null });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "LocationWarehouse",
                table: "Locations");

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 8, 18, 23, 13, 21, 643, DateTimeKind.Local).AddTicks(7322));

            migrationBuilder.UpdateData(
                table: "Companies",
                keyColumn: "CompanyID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 8, 18, 23, 13, 21, 643, DateTimeKind.Local).AddTicks(7339));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 1,
                column: "EnteredDate",
                value: new DateTime(2024, 8, 18, 23, 13, 21, 642, DateTimeKind.Local).AddTicks(7556));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 2,
                column: "EnteredDate",
                value: new DateTime(2024, 8, 18, 23, 13, 21, 642, DateTimeKind.Local).AddTicks(7609));

            migrationBuilder.UpdateData(
                table: "Locations",
                keyColumn: "LocationID",
                keyValue: 3,
                column: "EnteredDate",
                value: new DateTime(2024, 8, 18, 23, 13, 21, 642, DateTimeKind.Local).AddTicks(7611));
        }
    }
}
