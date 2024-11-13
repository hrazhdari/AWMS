using AWMS.app.Forms.RibbonUser;
using DevExpress.XtraEditors;

namespace AWMS.app.Forms.frmSmall
{
    public partial class frmBio : XtraForm
    {
        private readonly IServiceProvider _serviceRepository;
        private readonly UserSession _session;

        public frmBio(IServiceProvider ServiceRepository, int? userId = null)
        {
            InitializeComponent();
            _serviceRepository = ServiceRepository;
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
        }

        private void calculate_Click(object sender, EventArgs e)
        {
            // گرفتن تاریخ تولد
            DateTime birthDate = new DateTime(1987, 5, 27); // تغییر دهید به تاریخ تولد کاربر

            // تاریخ انتخاب‌شده
            DateTime selectedDate = dateEdit1.DateTime;
            if (selectedDate == DateTime.MinValue)
            {
                MessageBox.Show("لطفا یک تاریخ انتخاب کنید.");
                return;
            }

            // گرفتن فاکتورهای اضافی از کاربر
            int sleepHours = GetSleepHours(); // مدت خواب کاربر
            int stressLevel = GetStressLevel(); // سطح استرس کاربر
            int physicalActivity = GetPhysicalActivity(); // میزان فعالیت بدنی کاربر

            // تنظیم فاکتورها در محاسبات
            double physicalModifier = sleepHours > 7 ? 1.1 : 0.9; // اگر خواب کافی بوده باشد
            double emotionalModifier = stressLevel > 5 ? 0.8 : 1.2; // استرس زیاد باعث کاهش امتیاز احساسی
            double intellectualModifier = physicalActivity > 30 ? 1.2 : 0.8; // فعالیت بدنی بیشتر باعث افزایش تمرکز

            // محاسبه تعداد روزهای گذشته از تولد
            int daysAlive = (selectedDate - birthDate).Days;

            // محاسبه بیوریتم برای روز انتخاب‌شده با در نظر گرفتن فاکتورها
            double physical = CalculateBiorhythm(daysAlive, 23) * physicalModifier;
            double emotional = CalculateBiorhythm(daysAlive, 28) * emotionalModifier;
            double intellectual = CalculateBiorhythm(daysAlive, 33) * intellectualModifier;

            // توصیه‌ها بر اساس وضعیت
            string recommendation = "توصیه بر اساس وضعیت بیوریتم:\n\n";

            // توصیه برای وضعیت فیزیکی
            recommendation += GetPhysicalRecommendation(physical);
            // توصیه برای وضعیت احساسی
            recommendation += GetEmotionalRecommendation(emotional);
            // توصیه برای وضعیت ذهنی
            recommendation += GetIntellectualRecommendation(intellectual);

            // نمایش توصیه‌ها
            MessageBox.Show(recommendation, "توصیه‌های بیوریتم", MessageBoxButtons.OK, MessageBoxIcon.Information);

            // لیست نقاط برای فازهای مختلف بیوریتم
            List<double> physicalPoints = new List<double>();
            List<double> emotionalPoints = new List<double>();
            List<double> intellectualPoints = new List<double>();

            // محاسبه نقاط بیوریتم برای 30 روز قبل و بعد از تاریخ انتخاب‌شده
            for (int i = -15; i <= 15; i++)
            {
                int day = daysAlive + i;
                physicalPoints.Add(CalculateBiorhythm(day, 23) * physicalModifier);
                emotionalPoints.Add(CalculateBiorhythm(day, 28) * emotionalModifier);
                intellectualPoints.Add(CalculateBiorhythm(day, 33) * intellectualModifier);
            }

            // پاکسازی چارت قبلی
            chartControl1.Series.Clear();

            // ایجاد سری‌ها برای فازهای مختلف
            var physicalSeries = new DevExpress.XtraCharts.Series("Physical", DevExpress.XtraCharts.ViewType.Line);
            var emotionalSeries = new DevExpress.XtraCharts.Series("Emotional", DevExpress.XtraCharts.ViewType.Line);
            var intellectualSeries = new DevExpress.XtraCharts.Series("Intellectual", DevExpress.XtraCharts.ViewType.Line);

            // اضافه کردن نقاط به سری‌ها
            for (int i = 0; i < physicalPoints.Count; i++)
            {
                physicalSeries.Points.Add(new DevExpress.XtraCharts.SeriesPoint(i - 15, physicalPoints[i]));
                emotionalSeries.Points.Add(new DevExpress.XtraCharts.SeriesPoint(i - 15, emotionalPoints[i]));
                intellectualSeries.Points.Add(new DevExpress.XtraCharts.SeriesPoint(i - 15, intellectualPoints[i]));
            }

            // اضافه کردن سری‌ها به چارت
            chartControl1.Series.Add(physicalSeries);
            chartControl1.Series.Add(emotionalSeries);
            chartControl1.Series.Add(intellectualSeries);

            // تنظیم ظاهر چارت
            chartControl1.Legend.Visibility = DevExpress.Utils.DefaultBoolean.True;
            chartControl1.Titles.Clear();
            chartControl1.Titles.Add(new DevExpress.XtraCharts.ChartTitle { Text = "Biorhythm Chart" });
        }

        // تابع برای محاسبه بیوریتم
        private double CalculateBiorhythm(int days, int cycle)
        {
            return Math.Sin(2 * Math.PI * days / cycle);
        }

        // توابع برای گرفتن فاکتورهای اضافی از کاربر
        private int GetSleepHours()
        {
            string input = Microsoft.VisualBasic.Interaction.InputBox("چند ساعت خوابیده‌اید؟", "مدت خواب", "8");
            int.TryParse(input, out int sleepHours);
            return sleepHours;
        }

        private int GetStressLevel()
        {
            string input = Microsoft.VisualBasic.Interaction.InputBox("سطح استرس شما چقدر است؟ (1-10)", "سطح استرس", "5");
            int.TryParse(input, out int stressLevel);
            return stressLevel;
        }

        private int GetPhysicalActivity()
        {
            string input = Microsoft.VisualBasic.Interaction.InputBox("چقدر فعالیت بدنی داشته‌اید؟ (به دقیقه)", "فعالیت بدنی", "30");
            int.TryParse(input, out int physicalActivity);
            return physicalActivity;
        }

        private void frmBio_Load(object sender, EventArgs e)
        {
            // تنظیم تقویم فارسی برای dateEdit1
        }

        // توابع برای توصیه‌ها
        private string GetPhysicalRecommendation(double physical)
        {
            if (physical > 0.5)
            {
                return "وضعیت فیزیکی: انرژی شما بالاست! از این زمان برای فعالیت‌های بدنی، ورزش، و ماجراجویی‌های جدید استفاده کنید.\n";
            }
            else if (physical > 0)
            {
                return "وضعیت فیزیکی: انرژی شما خوب است. می‌توانید به فعالیت‌های روزمره خود ادامه دهید، اما از فعالیت‌های شدید پرهیز کنید.\n";
            }
            else
            {
                return "وضعیت فیزیکی: ممکن است احساس خستگی کنید. استراحت کافی داشته باشید و از فعالیت‌های سنگین پرهیز کنید. تمرکز روی کارهای آرامش‌بخش می‌تواند مفید باشد.\n";
            }
        }

        private string GetEmotionalRecommendation(double emotional)
        {
            if (emotional > 0.5)
            {
                return "وضعیت احساسی: حس خوبی دارید! این زمان مناسبی برای برقراری ارتباطات اجتماعی و گسترش روابط عاطفی است. از احساسات مثبت خود بهره‌برداری کنید.\n";
            }
            else if (emotional > 0)
            {
                return "وضعیت احساسی: احساساتی دارید. بهتر است به خود زمان بدهید و از محیط‌های شلوغ دوری کنید. مدیتیشن و تفکر مثبت می‌تواند کمک کند.\n";
            }
            else
            {
                return "وضعیت احساسی: ممکن است کمی حساس یا نگران باشید. آرامش خود را حفظ کنید و از تنش‌ها دوری کنید. با دوستان یا خانواده صحبت کنید تا احساس بهتری داشته باشید.\n";
            }
        }

        private string GetIntellectualRecommendation(double intellectual)
        {
            if (intellectual > 0.5)
            {
                return "وضعیت ذهنی: ذهن شما در بهترین حالت خود است! از این زمان برای مطالعه، یادگیری مهارت‌های جدید، و حل مسائل پیچیده استفاده کنید. ایده‌های خلاقانه‌تان را به عمل تبدیل کنید.\n";
            }
            else if (intellectual > 0)
            {
                return "وضعیت ذهنی: تمرکز شما خوب است. می‌توانید به کارهای چالش‌برانگیز بپردازید، اما از فشار زیاد بر خود پرهیز کنید.\n";
            }
            else
            {
                return "وضعیت ذهنی: ممکن است تمرکز شما کمتر باشد. بهتر است از کارهای ذهنی دشوار خودداری کنید و به فعالیت‌های ساده‌تر بپردازید. کمی استراحت می‌تواند مفید باشد.\n";
            }
        }
    }
}
