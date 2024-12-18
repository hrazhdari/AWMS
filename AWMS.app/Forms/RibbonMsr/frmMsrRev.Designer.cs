namespace AWMS.app.Forms.RibbonMsr
{
    partial class frmMsrRev
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMsrRev));
            splitContainerControl2 = new DevExpress.XtraEditors.SplitContainerControl();
            gridControl1 = new DevExpress.XtraGrid.GridControl();
            gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            labelControl7 = new DevExpress.XtraEditors.LabelControl();
            textEdit1 = new DevExpress.XtraEditors.SpinEdit();
            labelControl10 = new DevExpress.XtraEditors.LabelControl();
            labelControl9 = new DevExpress.XtraEditors.LabelControl();
            labelControl8 = new DevExpress.XtraEditors.LabelControl();
            labelControl6 = new DevExpress.XtraEditors.LabelControl();
            labelControl5 = new DevExpress.XtraEditors.LabelControl();
            labelControl4 = new DevExpress.XtraEditors.LabelControl();
            labelControl1 = new DevExpress.XtraEditors.LabelControl();
            labelControl2 = new DevExpress.XtraEditors.LabelControl();
            UpdateMsrRevBtn = new DevExpress.XtraEditors.SimpleButton();
            refreshBtn = new DevExpress.XtraEditors.SimpleButton();
            labelControl3 = new DevExpress.XtraEditors.LabelControl();
            simpleButton1 = new DevExpress.XtraEditors.SimpleButton();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2).BeginInit();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2.Panel1).BeginInit();
            splitContainerControl2.Panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2.Panel2).BeginInit();
            splitContainerControl2.Panel2.SuspendLayout();
            splitContainerControl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)gridControl1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)textEdit1.Properties).BeginInit();
            SuspendLayout();
            // 
            // splitContainerControl2
            // 
            splitContainerControl2.Dock = DockStyle.Fill;
            splitContainerControl2.Horizontal = false;
            splitContainerControl2.Location = new Point(0, 0);
            splitContainerControl2.Name = "splitContainerControl2";
            // 
            // splitContainerControl2.Panel1
            // 
            splitContainerControl2.Panel1.Appearance.BackColor = Color.FromArgb(192, 192, 255);
            splitContainerControl2.Panel1.Appearance.Options.UseBackColor = true;
            splitContainerControl2.Panel1.AutoScroll = true;
            splitContainerControl2.Panel1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl2.Panel1.Controls.Add(gridControl1);
            splitContainerControl2.Panel1.Text = "Panel1";
            // 
            // splitContainerControl2.Panel2
            // 
            splitContainerControl2.Panel2.Appearance.BackColor = Color.FromArgb(224, 224, 224);
            splitContainerControl2.Panel2.Appearance.Options.UseBackColor = true;
            splitContainerControl2.Panel2.AutoScroll = true;
            splitContainerControl2.Panel2.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl2.Panel2.Controls.Add(simpleButton1);
            splitContainerControl2.Panel2.Controls.Add(labelControl7);
            splitContainerControl2.Panel2.Controls.Add(textEdit1);
            splitContainerControl2.Panel2.Controls.Add(labelControl10);
            splitContainerControl2.Panel2.Controls.Add(labelControl9);
            splitContainerControl2.Panel2.Controls.Add(labelControl8);
            splitContainerControl2.Panel2.Controls.Add(labelControl6);
            splitContainerControl2.Panel2.Controls.Add(labelControl5);
            splitContainerControl2.Panel2.Controls.Add(labelControl4);
            splitContainerControl2.Panel2.Controls.Add(labelControl1);
            splitContainerControl2.Panel2.Controls.Add(labelControl2);
            splitContainerControl2.Panel2.Controls.Add(UpdateMsrRevBtn);
            splitContainerControl2.Panel2.Controls.Add(refreshBtn);
            splitContainerControl2.Panel2.Controls.Add(labelControl3);
            splitContainerControl2.Panel2.Text = "Panel2";
            splitContainerControl2.ShowSplitGlyph = DevExpress.Utils.DefaultBoolean.True;
            splitContainerControl2.Size = new Size(1116, 583);
            splitContainerControl2.SplitterPosition = 438;
            splitContainerControl2.TabIndex = 0;
            // 
            // gridControl1
            // 
            gridControl1.Dock = DockStyle.Fill;
            gridControl1.Location = new Point(0, 0);
            gridControl1.MainView = gridView1;
            gridControl1.Margin = new Padding(30);
            gridControl1.Name = "gridControl1";
            gridControl1.Size = new Size(1112, 434);
            gridControl1.TabIndex = 0;
            gridControl1.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] { gridView1 });
            // 
            // gridView1
            // 
            gridView1.GridControl = gridControl1;
            gridView1.Name = "gridView1";
            gridView1.OptionsView.ShowAutoFilterRow = true;
            gridView1.OptionsView.ShowFooter = true;
            gridView1.FocusedRowChanged += gridView1_FocusedRowChanged;
            // 
            // labelControl7
            // 
            labelControl7.Appearance.Font = new Font("Tahoma", 8.25F, FontStyle.Italic, GraphicsUnit.Point);
            labelControl7.Appearance.ForeColor = Color.Gray;
            labelControl7.Appearance.Options.UseFont = true;
            labelControl7.Appearance.Options.UseForeColor = true;
            labelControl7.Location = new Point(228, 49);
            labelControl7.Name = "labelControl7";
            labelControl7.Size = new Size(33, 13);
            labelControl7.TabIndex = 31;
            labelControl7.Text = "0~100";
            // 
            // textEdit1
            // 
            textEdit1.EditValue = new decimal(new int[] { 0, 0, 0, 0 });
            textEdit1.Location = new Point(121, 42);
            textEdit1.Margin = new Padding(3, 2, 3, 2);
            textEdit1.Name = "textEdit1";
            textEdit1.Properties.Appearance.Font = new Font("Tahoma", 9F, FontStyle.Bold, GraphicsUnit.Point);
            textEdit1.Properties.Appearance.ForeColor = Color.SaddleBrown;
            textEdit1.Properties.Appearance.Options.UseFont = true;
            textEdit1.Properties.Appearance.Options.UseForeColor = true;
            textEdit1.Properties.Appearance.Options.UseTextOptions = true;
            textEdit1.Properties.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            textEdit1.Properties.Appearance.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            textEdit1.Properties.AppearanceReadOnly.Options.UseTextOptions = true;
            textEdit1.Properties.AppearanceReadOnly.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            textEdit1.Properties.AppearanceReadOnly.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            textEdit1.Properties.AutoHeight = false;
            textEdit1.Properties.BeepOnError = true;
            textEdit1.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            textEdit1.Properties.ContextImageOptions.Alignment = DevExpress.XtraEditors.ContextImageAlignment.Far;
            textEdit1.Properties.ContextImageOptions.Image = (Image)resources.GetObject("textEdit1.Properties.ContextImageOptions.Image");
            textEdit1.Properties.EditValueChangedFiringMode = DevExpress.XtraEditors.Controls.EditValueChangedFiringMode.Default;
            textEdit1.Properties.IsFloatValue = false;
            textEdit1.Properties.MaskSettings.Set("mask", "d");
            textEdit1.Properties.MaskSettings.Set("autoHideDecimalSeparator", false);
            textEdit1.Properties.MaskSettings.Set("hideInsignificantZeros", null);
            textEdit1.Properties.MaxValue = new decimal(new int[] { 100, 0, 0, 0 });
            textEdit1.Properties.UseMaskAsDisplayFormat = true;
            textEdit1.Size = new Size(101, 25);
            textEdit1.TabIndex = 30;
            textEdit1.KeyPress += textEdit1_KeyPress;
            // 
            // labelControl10
            // 
            labelControl10.Appearance.Font = new Font("Tahoma", 9.75F, FontStyle.Bold, GraphicsUnit.Point);
            labelControl10.Appearance.ForeColor = Color.FromArgb(128, 64, 64);
            labelControl10.Appearance.Options.UseFont = true;
            labelControl10.Appearance.Options.UseForeColor = true;
            labelControl10.Location = new Point(98, 46);
            labelControl10.Name = "labelControl10";
            labelControl10.Size = new Size(17, 16);
            labelControl10.TabIndex = 29;
            labelControl10.Text = "->";
            // 
            // labelControl9
            // 
            labelControl9.Appearance.Font = new Font("Tahoma", 9.75F, FontStyle.Bold, GraphicsUnit.Point);
            labelControl9.Appearance.ForeColor = Color.FromArgb(0, 192, 192);
            labelControl9.Appearance.Options.UseFont = true;
            labelControl9.Appearance.Options.UseForeColor = true;
            labelControl9.Location = new Point(64, 46);
            labelControl9.Name = "labelControl9";
            labelControl9.Size = new Size(8, 16);
            labelControl9.TabIndex = 28;
            labelControl9.Text = "0";
            // 
            // labelControl8
            // 
            labelControl8.Appearance.Font = new Font("Tahoma", 9.75F, FontStyle.Bold, GraphicsUnit.Point);
            labelControl8.Appearance.ForeColor = Color.DodgerBlue;
            labelControl8.Appearance.Options.UseFont = true;
            labelControl8.Appearance.Options.UseForeColor = true;
            labelControl8.Location = new Point(24, 46);
            labelControl8.Name = "labelControl8";
            labelControl8.Size = new Size(34, 16);
            labelControl8.TabIndex = 27;
            labelControl8.Text = "Rev :";
            // 
            // labelControl6
            // 
            labelControl6.Appearance.Font = new Font("Tahoma", 14.25F, FontStyle.Italic, GraphicsUnit.Point);
            labelControl6.Appearance.ForeColor = Color.SeaShell;
            labelControl6.Appearance.Options.UseFont = true;
            labelControl6.Appearance.Options.UseForeColor = true;
            labelControl6.Location = new Point(488, 88);
            labelControl6.Name = "labelControl6";
            labelControl6.Size = new Size(0, 23);
            labelControl6.TabIndex = 24;
            // 
            // labelControl5
            // 
            labelControl5.Appearance.Font = new Font("Tahoma", 14.25F, FontStyle.Italic, GraphicsUnit.Point);
            labelControl5.Appearance.ForeColor = Color.Snow;
            labelControl5.Appearance.Options.UseFont = true;
            labelControl5.Appearance.Options.UseForeColor = true;
            labelControl5.Location = new Point(523, 36);
            labelControl5.Name = "labelControl5";
            labelControl5.Size = new Size(0, 23);
            labelControl5.TabIndex = 23;
            // 
            // labelControl4
            // 
            labelControl4.Appearance.Font = new Font("Tahoma", 14.25F, FontStyle.Italic, GraphicsUnit.Point);
            labelControl4.Appearance.ForeColor = Color.Snow;
            labelControl4.Appearance.Options.UseFont = true;
            labelControl4.Appearance.Options.UseForeColor = true;
            labelControl4.Location = new Point(989, 46);
            labelControl4.Name = "labelControl4";
            labelControl4.Size = new Size(0, 23);
            labelControl4.TabIndex = 22;
            // 
            // labelControl1
            // 
            labelControl1.Appearance.Font = new Font("Tahoma", 18F, FontStyle.Bold | FontStyle.Italic, GraphicsUnit.Point);
            labelControl1.Appearance.ForeColor = Color.Khaki;
            labelControl1.Appearance.Options.UseFont = true;
            labelControl1.Appearance.Options.UseForeColor = true;
            labelControl1.Location = new Point(732, 88);
            labelControl1.Name = "labelControl1";
            labelControl1.Size = new Size(0, 29);
            labelControl1.TabIndex = 20;
            // 
            // labelControl2
            // 
            labelControl2.Appearance.BackColor = Color.Transparent;
            labelControl2.Appearance.Font = new Font("Tahoma", 21.75F, FontStyle.Bold | FontStyle.Italic, GraphicsUnit.Point);
            labelControl2.Appearance.ForeColor = Color.Gold;
            labelControl2.Appearance.Options.UseBackColor = true;
            labelControl2.Appearance.Options.UseFont = true;
            labelControl2.Appearance.Options.UseForeColor = true;
            labelControl2.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            labelControl2.Location = new Point(658, 57);
            labelControl2.Name = "labelControl2";
            labelControl2.Size = new Size(0, 35);
            labelControl2.TabIndex = 2;
            // 
            // UpdateMsrRevBtn
            // 
            UpdateMsrRevBtn.Appearance.BackColor = Color.FromArgb(255, 255, 192);
            UpdateMsrRevBtn.Appearance.Font = new Font("Tahoma", 12F, FontStyle.Bold, GraphicsUnit.Point);
            UpdateMsrRevBtn.Appearance.ForeColor = Color.Black;
            UpdateMsrRevBtn.Appearance.Options.UseBackColor = true;
            UpdateMsrRevBtn.Appearance.Options.UseFont = true;
            UpdateMsrRevBtn.Appearance.Options.UseForeColor = true;
            UpdateMsrRevBtn.ImageOptions.Image = (Image)resources.GetObject("UpdateMsrRevBtn.ImageOptions.Image");
            UpdateMsrRevBtn.Location = new Point(23, 71);
            UpdateMsrRevBtn.Name = "UpdateMsrRevBtn";
            UpdateMsrRevBtn.Size = new Size(199, 48);
            UpdateMsrRevBtn.TabIndex = 0;
            UpdateMsrRevBtn.Text = "Update MSR Rev";
            UpdateMsrRevBtn.Click += UpdateMsrRevBtn_Click;
            // 
            // refreshBtn
            // 
            refreshBtn.Appearance.BackColor = Color.FromArgb(192, 255, 192);
            refreshBtn.Appearance.Options.UseBackColor = true;
            refreshBtn.Appearance.Options.UseFont = true;
            refreshBtn.ImageOptions.Image = (Image)resources.GetObject("refreshBtn.ImageOptions.Image");
            refreshBtn.Location = new Point(23, 11);
            refreshBtn.Name = "refreshBtn";
            refreshBtn.Size = new Size(199, 28);
            refreshBtn.TabIndex = 19;
            refreshBtn.Text = "Refresh Grid Data";
            refreshBtn.Click += refreshBtn_Click;
            // 
            // labelControl3
            // 
            labelControl3.Appearance.Font = new Font("Tahoma", 21.75F, FontStyle.Bold | FontStyle.Italic, GraphicsUnit.Point);
            labelControl3.Appearance.ForeColor = Color.Moccasin;
            labelControl3.Appearance.Options.UseFont = true;
            labelControl3.Appearance.Options.UseForeColor = true;
            labelControl3.Location = new Point(754, 15);
            labelControl3.Name = "labelControl3";
            labelControl3.Size = new Size(0, 35);
            labelControl3.TabIndex = 21;
            // 
            // simpleButton1
            // 
            simpleButton1.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            simpleButton1.Appearance.BackColor = Color.Tomato;
            simpleButton1.Appearance.Font = new Font("Tahoma", 11.25F, FontStyle.Bold, GraphicsUnit.Point);
            simpleButton1.Appearance.Options.UseBackColor = true;
            simpleButton1.Appearance.Options.UseFont = true;
            simpleButton1.ImageOptions.Image = (Image)resources.GetObject("simpleButton1.ImageOptions.Image");
            simpleButton1.Location = new Point(951, 11);
            simpleButton1.Name = "simpleButton1";
            simpleButton1.Size = new Size(151, 108);
            simpleButton1.TabIndex = 32;
            simpleButton1.Text = "Delete MSR";
            simpleButton1.Click += simpleButton1_Click;
            // 
            // frmMsrRev
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1116, 583);
            Controls.Add(splitContainerControl2);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            IconOptions.Icon = (Icon)resources.GetObject("frmMsrRev.IconOptions.Icon");
            IconOptions.Image = (Image)resources.GetObject("frmMsrRev.IconOptions.Image");
            MaximizeBox = false;
            Name = "frmMsrRev";
            ShowInTaskbar = false;
            StartPosition = FormStartPosition.CenterScreen;
            Text = "MSR Rev / Delete";
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2.Panel1).EndInit();
            splitContainerControl2.Panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2.Panel2).EndInit();
            splitContainerControl2.Panel2.ResumeLayout(false);
            splitContainerControl2.Panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2).EndInit();
            splitContainerControl2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)gridControl1).EndInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).EndInit();
            ((System.ComponentModel.ISupportInitialize)textEdit1.Properties).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl1;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl2;
        private DevExpress.XtraGrid.GridControl gridControl1;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.SimpleButton UpdateMsrRevBtn;
        private DevExpress.XtraEditors.SimpleButton refreshBtn;
        private DevExpress.XtraEditors.LabelControl labelControl6;
        private DevExpress.XtraEditors.LabelControl labelControl5;
        private DevExpress.XtraEditors.LabelControl labelControl4;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.LabelControl labelControl3;
        private DevExpress.XtraEditors.LabelControl labelControl9;
        private DevExpress.XtraEditors.LabelControl labelControl8;
        private DevExpress.XtraEditors.LabelControl labelControl10;
        private DevExpress.XtraEditors.SpinEdit textEdit1;
        private DevExpress.XtraEditors.LabelControl labelControl7;
        private DevExpress.XtraEditors.SimpleButton simpleButton1;
    }
}