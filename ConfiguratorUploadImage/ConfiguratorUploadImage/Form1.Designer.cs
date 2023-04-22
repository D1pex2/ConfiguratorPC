namespace ConfiguratorUploadImage
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.pathTextBox = new System.Windows.Forms.TextBox();
            this.browseButton = new System.Windows.Forms.Button();
            this.componentsComboBox = new System.Windows.Forms.ComboBox();
            this.uploadButton = new System.Windows.Forms.Button();
            this.DeleteAllButton = new System.Windows.Forms.Button();
            this.CompressButton = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // pathTextBox
            // 
            this.pathTextBox.Location = new System.Drawing.Point(12, 12);
            this.pathTextBox.Name = "pathTextBox";
            this.pathTextBox.Size = new System.Drawing.Size(416, 20);
            this.pathTextBox.TabIndex = 0;
            // 
            // browseButton
            // 
            this.browseButton.Location = new System.Drawing.Point(435, 10);
            this.browseButton.Name = "browseButton";
            this.browseButton.Size = new System.Drawing.Size(33, 23);
            this.browseButton.TabIndex = 1;
            this.browseButton.Text = "...";
            this.browseButton.UseVisualStyleBackColor = true;
            this.browseButton.Click += new System.EventHandler(this.BrowseButton_Click);
            // 
            // componentsComboBox
            // 
            this.componentsComboBox.DisplayMember = "Name";
            this.componentsComboBox.FormattingEnabled = true;
            this.componentsComboBox.Location = new System.Drawing.Point(12, 38);
            this.componentsComboBox.Name = "componentsComboBox";
            this.componentsComboBox.Size = new System.Drawing.Size(456, 21);
            this.componentsComboBox.TabIndex = 2;
            // 
            // uploadButton
            // 
            this.uploadButton.Location = new System.Drawing.Point(12, 65);
            this.uploadButton.Name = "uploadButton";
            this.uploadButton.Size = new System.Drawing.Size(89, 23);
            this.uploadButton.TabIndex = 3;
            this.uploadButton.Text = "Загрузить";
            this.uploadButton.UseVisualStyleBackColor = true;
            this.uploadButton.Click += new System.EventHandler(this.UploadButton_Click);
            // 
            // DeleteAllButton
            // 
            this.DeleteAllButton.Location = new System.Drawing.Point(379, 65);
            this.DeleteAllButton.Name = "DeleteAllButton";
            this.DeleteAllButton.Size = new System.Drawing.Size(89, 23);
            this.DeleteAllButton.TabIndex = 4;
            this.DeleteAllButton.Text = "Удалить все";
            this.DeleteAllButton.UseVisualStyleBackColor = true;
            this.DeleteAllButton.Click += new System.EventHandler(this.DeleteAllButton_Click);
            // 
            // CompressButton
            // 
            this.CompressButton.Location = new System.Drawing.Point(107, 65);
            this.CompressButton.Name = "CompressButton";
            this.CompressButton.Size = new System.Drawing.Size(89, 23);
            this.CompressButton.TabIndex = 5;
            this.CompressButton.Text = "Сжать";
            this.CompressButton.UseVisualStyleBackColor = true;
            this.CompressButton.Click += new System.EventHandler(this.CompressButton_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(480, 97);
            this.Controls.Add(this.CompressButton);
            this.Controls.Add(this.DeleteAllButton);
            this.Controls.Add(this.uploadButton);
            this.Controls.Add(this.componentsComboBox);
            this.Controls.Add(this.browseButton);
            this.Controls.Add(this.pathTextBox);
            this.Name = "Form1";
            this.Text = "Загрузка картинок";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox pathTextBox;
        private System.Windows.Forms.Button browseButton;
        private System.Windows.Forms.ComboBox componentsComboBox;
        private System.Windows.Forms.Button uploadButton;
        private System.Windows.Forms.Button DeleteAllButton;
        private System.Windows.Forms.Button CompressButton;
    }
}

