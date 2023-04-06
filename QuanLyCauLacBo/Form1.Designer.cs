namespace QuanLyCauLacBo
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            label2 = new Label();
            label1 = new Label();
            txtTendangnhap = new TextBox();
            txtMatkhau = new TextBox();
            btnDangnhap = new Button();
            SuspendLayout();
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.BackColor = Color.Transparent;
            label2.FlatStyle = FlatStyle.Flat;
            label2.Font = new Font("Arial", 10.2F, FontStyle.Bold, GraphicsUnit.Point);
            label2.ForeColor = Color.White;
            label2.Location = new Point(416, 208);
            label2.Margin = new Padding(5, 0, 5, 0);
            label2.Name = "label2";
            label2.Size = new Size(216, 33);
            label2.TabIndex = 1;
            label2.Text = "Tên đăng nhập";
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.BackColor = Color.Transparent;
            label1.FlatStyle = FlatStyle.Flat;
            label1.Font = new Font("Arial", 10.2F, FontStyle.Bold, GraphicsUnit.Point);
            label1.ForeColor = Color.White;
            label1.Location = new Point(416, 293);
            label1.Margin = new Padding(5, 0, 5, 0);
            label1.Name = "label1";
            label1.Size = new Size(139, 33);
            label1.TabIndex = 2;
            label1.Text = "Mật khẩu";
            // 
            // txtTendangnhap
            // 
            txtTendangnhap.BackColor = Color.White;
            txtTendangnhap.Location = new Point(622, 208);
            txtTendangnhap.Margin = new Padding(5);
            txtTendangnhap.Name = "txtTendangnhap";
            txtTendangnhap.Size = new Size(270, 39);
            txtTendangnhap.TabIndex = 3;
            txtTendangnhap.TextChanged += txtTendangnhap_TextChanged;
            // 
            // txtMatkhau
            // 
            txtMatkhau.Location = new Point(622, 293);
            txtMatkhau.Margin = new Padding(5);
            txtMatkhau.Name = "txtMatkhau";
            txtMatkhau.Size = new Size(270, 39);
            txtMatkhau.TabIndex = 4;
            // 
            // btnDangnhap
            // 
            btnDangnhap.BackColor = Color.Transparent;
            btnDangnhap.BackgroundImageLayout = ImageLayout.Center;
            btnDangnhap.FlatStyle = FlatStyle.Flat;
            btnDangnhap.Font = new Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point);
            btnDangnhap.ForeColor = SystemColors.ButtonFace;
            btnDangnhap.Location = new Point(416, 382);
            btnDangnhap.Margin = new Padding(5);
            btnDangnhap.Name = "btnDangnhap";
            btnDangnhap.Size = new Size(479, 62);
            btnDangnhap.TabIndex = 5;
            btnDangnhap.Text = "Đăng nhập";
            btnDangnhap.TextImageRelation = TextImageRelation.ImageAboveText;
            btnDangnhap.UseVisualStyleBackColor = false;
            btnDangnhap.Click += btnDangnhap_Click;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = SystemColors.ActiveBorder;
            BackgroundImage = (Image)resources.GetObject("$this.BackgroundImage");
            BackgroundImageLayout = ImageLayout.Center;
            ClientSize = new Size(1271, 725);
            Controls.Add(btnDangnhap);
            Controls.Add(txtMatkhau);
            Controls.Add(txtTendangnhap);
            Controls.Add(label1);
            Controls.Add(label2);
            Margin = new Padding(5);
            Name = "Form1";
            Text = "Đăng nhập";
            Load += Form1_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion
        private Label label2;
        private Label label1;
        private TextBox txtTendangnhap;
        private TextBox txtMatkhau;
        private Button btnDangnhap;
    }
}