using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AWMS.datalayer.Migrations
{
    /// <inheritdoc />
    public partial class locitemsRemark : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {

            migrationBuilder.AddColumn<string>(
                name: "RemarkLocitemID",
                table: "LocItems",
                type: "nvarchar(300)",
                maxLength: 300,
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {

            migrationBuilder.DropColumn(
                name: "RemarkLocitemID",
                table: "LocItems");
        }
    }
}
