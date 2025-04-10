namespace AWMS.app.Forms.RibbonSetting
{
    partial class frmDatabaseSetting
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmDatabaseSetting));
            panelControl1 = new DevExpress.XtraEditors.PanelControl();
            panelControl2 = new DevExpress.XtraEditors.PanelControl();
            simpleButton1 = new DevExpress.XtraEditors.SimpleButton();
            labelControl1 = new DevExpress.XtraEditors.LabelControl();
            labelControl2 = new DevExpress.XtraEditors.LabelControl();
            labelControl3 = new DevExpress.XtraEditors.LabelControl();
            labelControl4 = new DevExpress.XtraEditors.LabelControl();
            labelControl5 = new DevExpress.XtraEditors.LabelControl();
            labelControl6 = new DevExpress.XtraEditors.LabelControl();
            ((System.ComponentModel.ISupportInitialize)panelControl1).BeginInit();
            panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)panelControl2).BeginInit();
            panelControl2.SuspendLayout();
            SuspendLayout();
            // 
            // panelControl1
            // 
            panelControl1.Controls.Add(panelControl2);
            panelControl1.Dock = DockStyle.Fill;
            panelControl1.Location = new Point(0, 0);
            panelControl1.Name = "panelControl1";
            panelControl1.Size = new Size(987, 534);
            panelControl1.TabIndex = 0;
            // 
            // panelControl2
            // 
            panelControl2.Controls.Add(labelControl6);
            panelControl2.Controls.Add(labelControl5);
            panelControl2.Controls.Add(labelControl4);
            panelControl2.Controls.Add(labelControl3);
            panelControl2.Controls.Add(labelControl2);
            panelControl2.Controls.Add(simpleButton1);
            panelControl2.Controls.Add(labelControl1);
            panelControl2.Location = new Point(12, 12);
            panelControl2.Name = "panelControl2";
            panelControl2.Size = new Size(465, 144);
            panelControl2.TabIndex = 0;
            // 
            // simpleButton1
            // 
            simpleButton1.Appearance.BackColor = Color.FromArgb(255, 192, 192);
            simpleButton1.Appearance.Font = new Font("Tahoma", 11.25F, FontStyle.Bold, GraphicsUnit.Point);
            simpleButton1.Appearance.Options.UseBackColor = true;
            simpleButton1.Appearance.Options.UseFont = true;
            simpleButton1.Location = new Point(46, 112);
            simpleButton1.Name = "simpleButton1";
            simpleButton1.Size = new Size(289, 23);
            simpleButton1.TabIndex = 2;
            simpleButton1.Text = "Run Update Statistics";
            simpleButton1.Click += simpleButton1_Click;
            // 
            // labelControl1
            // 
            labelControl1.Appearance.BackColor = Color.FromArgb(0, 192, 192);
            labelControl1.Appearance.Font = new Font("Tahoma", 9.75F, FontStyle.Bold, GraphicsUnit.Point);
            labelControl1.Appearance.Options.UseBackColor = true;
            labelControl1.Appearance.Options.UseFont = true;
            labelControl1.Location = new Point(5, 5);
            labelControl1.Name = "labelControl1";
            labelControl1.Size = new Size(107, 16);
            labelControl1.TabIndex = 1;
            labelControl1.Text = "UpdateStatistics";
            // 
            // labelControl2
            // 
            labelControl2.LineLocation = DevExpress.XtraEditors.LineLocation.Center;
            labelControl2.LineStyle = System.Drawing.Drawing2D.DashStyle.Dash;
            labelControl2.LineVisible = true;
            labelControl2.Location = new Point(46, 37);
            labelControl2.Name = "labelControl2";
            labelControl2.Size = new Size(364, 13);
            labelControl2.TabIndex = 1;
            labelControl2.Text = "This button updates the database statistics to improve query performance. ";
            // 
            // labelControl3
            // 
            labelControl3.LineLocation = DevExpress.XtraEditors.LineLocation.Center;
            labelControl3.LineStyle = System.Drawing.Drawing2D.DashStyle.Dash;
            labelControl3.LineVisible = true;
            labelControl3.Location = new Point(46, 73);
            labelControl3.Name = "labelControl3";
            labelControl3.Size = new Size(410, 13);
            labelControl3.TabIndex = 3;
            labelControl3.Text = "Please note that it may temporarily slow down the system during the update process.";
            // 
            // labelControl4
            // 
            labelControl4.ImageOptions.Image = (Image)resources.GetObject("labelControl4.ImageOptions.Image");
            labelControl4.Location = new Point(5, 37);
            labelControl4.Name = "labelControl4";
            labelControl4.Size = new Size(32, 32);
            labelControl4.TabIndex = 1;
            // 
            // labelControl5
            // 
            labelControl5.LineLocation = DevExpress.XtraEditors.LineLocation.Center;
            labelControl5.LineStyle = System.Drawing.Drawing2D.DashStyle.Dash;
            labelControl5.LineVisible = true;
            labelControl5.Location = new Point(46, 56);
            labelControl5.Name = "labelControl5";
            labelControl5.Size = new Size(357, 13);
            labelControl5.TabIndex = 4;
            labelControl5.Text = "این دکمه آمارهای دیتابیس را به‌روزرسانی می‌کند تا عملکرد کوئری‌ها بهبود یابد.";
            // 
            // labelControl6
            // 
            labelControl6.LineLocation = DevExpress.XtraEditors.LineLocation.Center;
            labelControl6.LineStyle = System.Drawing.Drawing2D.DashStyle.Dash;
            labelControl6.LineVisible = true;
            labelControl6.Location = new Point(46, 92);
            labelControl6.Name = "labelControl6";
            labelControl6.Size = new Size(366, 13);
            labelControl6.TabIndex = 5;
            labelControl6.Text = "توجه داشته باشید که ممکن است در حین فرآیند، سیستم به‌طور موقت کند شود.";
            // 
            // frmDatabaseSetting
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(987, 534);
            Controls.Add(panelControl1);
            IconOptions.Image = (Image)resources.GetObject("frmDatabaseSetting.IconOptions.Image");
            Name = "frmDatabaseSetting";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Database Setting";
            ((System.ComponentModel.ISupportInitialize)panelControl1).EndInit();
            panelControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)panelControl2).EndInit();
            panelControl2.ResumeLayout(false);
            panelControl2.PerformLayout();
            ResumeLayout(false);
        }

        #endregion

        private DevExpress.XtraEditors.PanelControl panelControl1;
        private DevExpress.XtraEditors.PanelControl panelControl2;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.SimpleButton simpleButton1;
        private DevExpress.XtraEditors.LabelControl labelControl4;
        private DevExpress.XtraEditors.LabelControl labelControl3;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.LabelControl labelControl6;
        private DevExpress.XtraEditors.LabelControl labelControl5;
    }
}