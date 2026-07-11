# عليِ - Ali Counter App 📱

تطبيق iOS بسيط وجميل لحساب النقاط عند الضغط على اسم "علي"

## 🎯 المميزات

- ✅ واجهة مستخدم حديثة بـ SwiftUI
- ✅ تصميم جميل بتدرجات لونية
- ✅ حساب النقاط تلقائياً عند الضغط
- ✅ أنيميشن سلس وجميل
- ✅ زر إعادة تعيين النقاط
- ✅ بناء تلقائي على GitHub Actions
- ✅ توليد IPA تلقائي

## 📋 المتطلبات

- macOS 11 أو أحدث
- Xcode 13 أو أحدث
- iOS 14 أو أحدث (جهاز الهدف)

## 🚀 البدء السريع

### التطوير المحلي

```bash
# استنساخ المستودع
git clone https://github.com/alicfhnn1999-cyber/21Q.git
cd 21Q

# فتح المشروع في Xcode
open AliCounter/AliCounter.xcodeproj

# الضغط على Run أو اختصار Cmd+R
```

## 🔄 GitHub Actions التلقائي ⭐

### رابط الـ Actions المباشر:
```
https://github.com/alicfhnn1999-cyber/21Q/actions
```

عند كل دفع (push) إلى فرع `main`:

1. ✅ يتم تجميع التطبيق تلقائياً
2. ✅ يتم توليد Archive
3. ✅ يتم تصدير IPA
4. ✅ يتم ضغط الملفات
5. ✅ يتم رفع الملفات كـ Artifact

### خطوات الحصول على IPA:

#### 📍 الطريقة 1: من GitHub Actions (الأسهل)

1. اذهب إلى: https://github.com/alicfhnn1999-cyber/21Q/actions
2. اختر آخر بناء ناجح (الأخضر ✅)
3. انزل إلى قسم **Artifacts**
4. حمّل `AliCounter-IPA`
5. استخرج:
```bash
7z x AliCounter.7z
```

#### 📍 الطريقة 2: من سطر الأوامر

```bash
# انسخ رابط التنزيل من Actions
# ثم استخدم curl أو wget
curl -L "رابط_التنزيل" -o AliCounter.7z
7z x AliCounter.7z
```

## 💡 كيفية الاستخدام

1. **الضغط على زر "علي"** 🔘
   - كل ضغطة تضيف نقطة واحدة
   - يظهر أنيميشن جميل عند الإضافة

2. **عرض النقاط** 📊
   - يتم عرض إجمالي النقاط بحجم كبير وبارز

3. **إعادة التعيين** 🔄
   - اضغط زر "إعادة تعيين" لتصفير النقاط

## 🎨 التصميم

- **الألوان**: تدرج أزرق بنفسجي
- **الخط**: San Francisco (نظام التشغيل)
- **الحجم**: متجاوب مع جميع أحجام الأجهزة
- **الأنماط**: ظلال وتأثيرات بصرية جميلة

## 📁 هيكل المشروع

```
21Q/
├── AliCounter/
│   ├── AliCounterApp.swift          # نقطة الدخول الرئيسية
│   ├── ContentView.swift             # الواجهة والمنطق
│   ├── AliCounter.xcodeproj/         # ملف المشروع
│   ├── ExportOptions.plist           # خيارات تصدير IPA
│   └── Preview Content/              # محتوى المعاينة
├── .github/workflows/
│   └── build-ios.yml                 # سير العمل التلقائي ⭐
├── README.md                         # هذا الملف
├── SETUP.md                          # دليل الإعداد والبناء
└── .gitignore                        # ملفات التجاهل
```

## 📤 كيفية رفع التغييرات

```bash
# 1. عدّل الملفات
nano AliCounter/ContentView.swift

# 2. أضف التغييرات
git add .

# 3. التزم
git commit -m "وصف التغييرات"

# 4. ارفع
git push origin main

# ⏳ GitHub Actions سيبدأ تلقائياً!
# اذهب إلى https://github.com/alicfhnn1999-cyber/21Q/actions
```

## ✅ قائمة التحقق

- [ ] تم استنساخ المستودع
- [ ] تم فتح المشروع في Xcode
- [ ] تم اختبار على المحاكاة
- [ ] تم أول push إلى GitHub
- [ ] تم التحقق من Actions
- [ ] تم تحميل IPA

## 📚 الملفات المطلوبة الكاملة

### 1. **AliCounterApp.swift** - نقطة الدخول
```swift
import SwiftUI

@main
struct AliCounterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### 2. **ContentView.swift** - الواجهة الرئيسية
- العداد بـ SwiftUI
- زر "علي" الأساسي
- زر إعادة التعيين
- أنيميشن سلس

### 3. **.github/workflows/build-ios.yml** - Automation
- بناء تلقائي
- توليد IPA
- رفع Artifacts

### 4. **ExportOptions.plist** - خيارات التصدير
- إعدادات Code Signing
- خيارات التصدير

### 5. **.gitignore** - تجاهل الملفات
- ملفات Xcode
- مجلدات البناء

## 🔗 الروابط المهمة

| الرابط | الوصف |
|-------|-------|
| https://github.com/alicfhnn1999-cyber/21Q | المستودع الرئيسي |
| https://github.com/alicfhnn1999-cyber/21Q/actions | صفحة الـ Actions |
| https://github.com/alicfhnn1999-cyber/21Q/tree/main/.github/workflows | ملفات الـ Workflows |

## 📝 الملاحظات

- التطبيق يعمل بدون إنترنت
- البيانات تُحفظ أثناء جلسة التطبيق فقط
- لا توجد إعلانات أو تتبع
- الـ IPA يُحفظ لمدة 30 يوم

## 🆘 المساعدة

إذا واجهت مشكلة:
1. اقرأ ملف [SETUP.md](SETUP.md)
2. تحقق من [Actions](https://github.com/alicfhnn1999-cyber/21Q/actions)
3. أنشئ [Issue](https://github.com/alicfhnn1999-cyber/21Q/issues) في المستودع

## 👤 المطور

[alicfhnn1999-cyber](https://github.com/alicfhnn1999-cyber)

---

**تم البناء بـ ❤️ باستخدام SwiftUI و GitHub Actions**
