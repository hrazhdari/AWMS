namespace AWMS.app.Forms.RibbonVoucher
{
    partial class frmPrintMRC
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmPrintMRC));
            documentViewer1 = new DevExpress.XtraPrinting.Preview.DocumentViewer();
            SuspendLayout();
            // 
            // documentViewer1
            // 
            documentViewer1.Dock = DockStyle.Fill;
            documentViewer1.IsMetric = false;
            documentViewer1.Location = new Point(0, 0);
            documentViewer1.Name = "documentViewer1";
            documentViewer1.Size = new Size(1112, 584);
            documentViewer1.TabIndex = 1;
            // 
            // frmPrintMRC
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1112, 584);
            Controls.Add(documentViewer1);
            IconOptions.Image = (Image)resources.GetObject("frmPrintMRC.IconOptions.Image");
            Name = "frmPrintMRC";
            Text = "MRC Print";
            ResumeLayout(false);
        }

        #endregion

        private DevExpress.XtraPrinting.Preview.DocumentViewer documentViewer1;
    }
}