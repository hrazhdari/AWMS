namespace AWMS.app.Forms.frmSmall
{
    partial class PDFS
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PDFS));
            splitContainerControl1 = new DevExpress.XtraEditors.SplitContainerControl();
            btnExport = new DevExpress.XtraEditors.SimpleButton();
            btnShow = new DevExpress.XtraEditors.SimpleButton();
            radioGroup1 = new DevExpress.XtraEditors.RadioGroup();
            gridSplitContainer1 = new DevExpress.XtraGrid.GridSplitContainer();
            gridControl1 = new DevExpress.XtraGrid.GridControl();
            gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel1).BeginInit();
            splitContainerControl1.Panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel2).BeginInit();
            splitContainerControl1.Panel2.SuspendLayout();
            splitContainerControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)radioGroup1.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)gridSplitContainer1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)gridSplitContainer1.Panel1).BeginInit();
            gridSplitContainer1.Panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)gridSplitContainer1.Panel2).BeginInit();
            gridSplitContainer1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)gridControl1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).BeginInit();
            SuspendLayout();
            // 
            // splitContainerControl1
            // 
            splitContainerControl1.Appearance.BorderColor = Color.Gray;
            splitContainerControl1.Appearance.Options.UseBorderColor = true;
            splitContainerControl1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl1.Dock = DockStyle.Fill;
            splitContainerControl1.Horizontal = false;
            splitContainerControl1.IsSplitterFixed = true;
            splitContainerControl1.Location = new Point(0, 0);
            splitContainerControl1.Name = "splitContainerControl1";
            // 
            // splitContainerControl1.Panel1
            // 
            splitContainerControl1.Panel1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl1.Panel1.Controls.Add(btnExport);
            splitContainerControl1.Panel1.Controls.Add(btnShow);
            splitContainerControl1.Panel1.Controls.Add(radioGroup1);
            splitContainerControl1.Panel1.Text = "Panel1";
            // 
            // splitContainerControl1.Panel2
            // 
            splitContainerControl1.Panel2.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl1.Panel2.Controls.Add(gridSplitContainer1);
            splitContainerControl1.Panel2.Text = "Panel2";
            splitContainerControl1.ShowSplitGlyph = DevExpress.Utils.DefaultBoolean.True;
            splitContainerControl1.Size = new Size(861, 478);
            splitContainerControl1.SplitterPosition = 52;
            splitContainerControl1.TabIndex = 0;
            // 
            // btnExport
            // 
            btnExport.ImageOptions.Image = (Image)resources.GetObject("btnExport.ImageOptions.Image");
            btnExport.Location = new Point(584, 7);
            btnExport.Name = "btnExport";
            btnExport.Size = new Size(126, 33);
            btnExport.TabIndex = 2;
            btnExport.Text = "Export Excel";
            btnExport.Click += btnExport_Click;
            // 
            // btnShow
            // 
            btnShow.ImageOptions.Image = (Image)resources.GetObject("btnShow.ImageOptions.Image");
            btnShow.Location = new Point(440, 7);
            btnShow.Name = "btnShow";
            btnShow.Size = new Size(126, 33);
            btnShow.TabIndex = 1;
            btnShow.Text = "Show PDF's";
            btnShow.Click += btnShow_Click;
            // 
            // radioGroup1
            // 
            radioGroup1.Location = new Point(8, 2);
            radioGroup1.Name = "radioGroup1";
            radioGroup1.Properties.Appearance.BackColor = Color.Transparent;
            radioGroup1.Properties.Appearance.Options.UseBackColor = true;
            radioGroup1.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            radioGroup1.Properties.Items.AddRange(new DevExpress.XtraEditors.Controls.RadioGroupItem[] { new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "PL", true, null, "PL"), new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "IRN", true, null, "IRN"), new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "MIV", true, null, "MIV"), new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "MSR", true, null, "MSR"), new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "IVR", true, null, "IVR") });
            radioGroup1.Size = new Size(405, 43);
            radioGroup1.TabIndex = 0;
            // 
            // gridSplitContainer1
            // 
            gridSplitContainer1.Dock = DockStyle.Fill;
            gridSplitContainer1.Grid = gridControl1;
            gridSplitContainer1.Location = new Point(0, 0);
            gridSplitContainer1.Name = "gridSplitContainer1";
            // 
            // gridSplitContainer1.Panel1
            // 
            gridSplitContainer1.Panel1.Controls.Add(gridControl1);
            gridSplitContainer1.Size = new Size(853, 408);
            gridSplitContainer1.TabIndex = 0;
            // 
            // gridControl1
            // 
            gridControl1.Dock = DockStyle.Fill;
            gridControl1.Location = new Point(0, 0);
            gridControl1.MainView = gridView1;
            gridControl1.Name = "gridControl1";
            gridControl1.Size = new Size(853, 408);
            gridControl1.TabIndex = 0;
            gridControl1.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] { gridView1 });
            // 
            // gridView1
            // 
            gridView1.GridControl = gridControl1;
            gridView1.Name = "gridView1";
            gridView1.OptionsView.ShowFooter = true;
            // 
            // PDFS
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(861, 478);
            Controls.Add(splitContainerControl1);
            IconOptions.Image = (Image)resources.GetObject("PDFS.IconOptions.Image");
            Name = "PDFS";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "PDF's";
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel1).EndInit();
            splitContainerControl1.Panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel2).EndInit();
            splitContainerControl1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1).EndInit();
            splitContainerControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)radioGroup1.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)gridSplitContainer1.Panel1).EndInit();
            gridSplitContainer1.Panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)gridSplitContainer1.Panel2).EndInit();
            ((System.ComponentModel.ISupportInitialize)gridSplitContainer1).EndInit();
            gridSplitContainer1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)gridControl1).EndInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl1;
        private DevExpress.XtraEditors.SimpleButton btnExport;
        private DevExpress.XtraEditors.SimpleButton btnShow;
        private DevExpress.XtraEditors.RadioGroup radioGroup1;
        private DevExpress.XtraGrid.GridSplitContainer gridSplitContainer1;
        private DevExpress.XtraGrid.GridControl gridControl1;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
    }
}