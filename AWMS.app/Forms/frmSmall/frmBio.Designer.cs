namespace AWMS.app.Forms.frmSmall
{
    partial class frmBio
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmBio));
            chartControl1 = new DevExpress.XtraCharts.ChartControl();
            dateEdit1 = new DevExpress.XtraEditors.DateEdit();
            calculate = new DevExpress.XtraEditors.SimpleButton();
            ((System.ComponentModel.ISupportInitialize)chartControl1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dateEdit1.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dateEdit1.Properties.CalendarTimeProperties).BeginInit();
            SuspendLayout();
            // 
            // chartControl1
            // 
            chartControl1.Legend.LegendID = -1;
            chartControl1.Location = new Point(12, 81);
            chartControl1.Name = "chartControl1";
            chartControl1.Size = new Size(854, 370);
            chartControl1.TabIndex = 0;
            // 
            // dateEdit1
            // 
            dateEdit1.EditValue = null;
            dateEdit1.Location = new Point(522, 31);
            dateEdit1.Name = "dateEdit1";
            dateEdit1.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            dateEdit1.Properties.CalendarTimeProperties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            dateEdit1.Properties.CalendarView = DevExpress.XtraEditors.Repository.CalendarView.TouchUI;
            dateEdit1.Properties.VistaDisplayMode = DevExpress.Utils.DefaultBoolean.False;
            dateEdit1.Size = new Size(200, 20);
            dateEdit1.TabIndex = 1;
            // 
            // calculate
            // 
            calculate.Location = new Point(728, 29);
            calculate.Name = "calculate";
            calculate.Size = new Size(138, 23);
            calculate.TabIndex = 2;
            calculate.Text = "Calculate biorhythm";
            calculate.Click += calculate_Click;
            // 
            // frmBio
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(878, 463);
            Controls.Add(calculate);
            Controls.Add(dateEdit1);
            Controls.Add(chartControl1);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            IconOptions.LargeImage = (Image)resources.GetObject("frmBio.IconOptions.LargeImage");
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "frmBio";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "biorhythm";
            Load += frmBio_Load;
            ((System.ComponentModel.ISupportInitialize)chartControl1).EndInit();
            ((System.ComponentModel.ISupportInitialize)dateEdit1.Properties.CalendarTimeProperties).EndInit();
            ((System.ComponentModel.ISupportInitialize)dateEdit1.Properties).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DevExpress.XtraCharts.ChartControl chartControl1;
        private DevExpress.XtraEditors.DateEdit dateEdit1;
        private DevExpress.XtraEditors.SimpleButton calculate;
    }
}