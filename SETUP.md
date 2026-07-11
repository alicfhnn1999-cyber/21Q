# 📖 دليل الإعداد والبناء الكامل

## المتطلبات الأساسية

### 1. متطلبات النظام
- **macOS**: 11 أو أحدث
- **RAM**: 8 GB على الأقل
- **مساحة تخزين**: 15 GB حرة على الأقل

### 2. تثبيت Xcode
```bash
# تثبيت Xcode من App Store أو عبر سطر الأوامر:
xcode-select --install

# التحقق من التثبيت
xcode-select -p
# يجب أن يطبع: /Applications/Xcode.app/Contents/Developer
```

### 3. تثبيت الأدوات الإضافية
```bash
# عبر Homebrew
brew install p7zip    # لضغط الملفات
brew install git      # إذا لم تكن مثبتة
```

## 🔧 خطوات الإعداد المحلي

### الخطوة 1: استنساخ المستودع
```bash
git clone https://github.com/alicfhnn1999-cyber/21Q.git
cd 21Q
```

### الخطوة 2: التحقق من هيكل المشروع
```bash
# عرض هيكل المشروع
tree -L 2 AliCounter/

# أو استخدم:
ls -la AliCounter/

# يجب أن ترى هذه الملفات:
# - AliCounterApp.swift
# - ContentView.swift
# - AliCounter.xcodeproj
# - ExportOptions.plist
```

### الخطوة 3: فتح المشروع في Xcode
```bash
# الطريقة 1: عبر سطر الأوامر
open AliCounter/AliCounter.xcodeproj

# الطريقة 2: عبر Finder
# - افتح Finder
# - انتقل إلى المجلد 21Q
# - انقر نقراً مزدوجاً على AliCounter.xcodeproj
```

## ▶️ تشغيل التطبيق

### على المحاكاة (Simulator)
```bash
# الطريقة 1: من Xcode
# Product → Run (أو Cmd+R)

# الطريقة 2: من سطر الأوامر
cd AliCounter
xcodebuild \
  -scheme AliCounter \
  -configuration Debug \
  -derivedDataPath build \
  -destination 'platform=iOS Simulator,name=iPhone 15'
```

### على جهاز فعلي
```bash
# 1. قم بتوصيل iPhone/iPad بـ USB
# 2. في Xcode: Product → Run
# 3. اختر الجهاز من القائمة
# 4. أدخل كلمة مرور الجهاز عند الطلب
```

## 🏗️ البناء والتجميع

### بناء بسيط (Debug)
```bash
cd AliCounter
xcodebuild \
  -scheme AliCounter \
  -configuration Debug \
  -derivedDataPath build
```

### بناء للإطلاق (Release)
```bash
cd AliCounter
xcodebuild \
  -scheme AliCounter \
  -configuration Release \
  -sdk iphoneos \
  -derivedDataPath build
```

### إنشاء Archive (أرشيف)
```bash
cd AliCounter
xcodebuild \
  -scheme AliCounter \
  -configuration Release \
  -sdk iphoneos \
  -derivedDataPath build \
  archive \
  -archivePath build/AliCounter.xcarchive \
  CODE_SIGN_IDENTITY="" \
  CODE_SIGNING_REQUIRED=NO
```

### تصدير IPA
```bash
cd AliCounter

# 1. إنشاء ملف ExportOptions
cat > /tmp/ExportOptions.plist << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>method</key>
    <string>ad-hoc</string>
    <key>signingStyle</key>
    <string>automatic</string>
    <key>stripSwiftSymbols</key>
    <true/>
</dict>
</plist>
EOF

# 2. تصدير IPA
mkdir -p build/export
xcodebuild \
  -exportArchive \
  -archivePath build/AliCounter.xcarchive \
  -exportOptionsPlist /tmp/ExportOptions.plist \
  -exportPath build/export \
  CODE_SIGN_IDENTITY="" \
  CODE_SIGNING_REQUIRED=NO

# 3. التحقق من النتيجة
ls -lh build/export/AliCounter.ipa
```

## 🤖 استخدام GitHub Actions

### كيفية عمل Automation

عند دفع (push) أي تغييرات إلى فرع `main`:

1. ✅ GitHub Actions يكتشف التغييرات تلقائياً
2. ✅ ينسخ المشروع على خادم Apple
3. ✅ يجمع التطبيق تلقائياً
4. ✅ ينشئ IPA
5. ✅ يرفع الملفات كـ Artifact
6. ✅ يحفظها لمدة 30 يوم

### رابط الـ Actions المباشر:
```
https://github.com/alicfhnn1999-cyber/21Q/actions
```

### خطوات الحصول على IPA من Actions

#### 1️⃣ اذهب إلى صفحة Actions
```
https://github.com/alicfhnn1999-cyber/21Q/actions
```

#### 2️⃣ اختر آخر بناء ناجح
- ابحث عن الـ workflow باسم "Build iOS IPA 📱"
- اختر أحدث run بعلامة خضراء ✅

#### 3️⃣ حمّل الـ Artifact
- انزل إلى قسم **Artifacts**
- ستجد ملف باسم `AliCounter-IPA`
- اضغط للتحميل

#### 4️⃣ استخرج الملف
```bash
# بعد التحميل، استخرج الملف:
7z x AliCounter.7z

# أو على Mac، انقر نقراً مزدوجاً على الملف
# ستحصل على: AliCounter.ipa
```

## 📤 إرسال تحديثات للمشروع

### خطوات Push إلى GitHub:

```bash
# 1. أنشئ فرع جديد (اختياري)
git checkout -b feature/my-feature

# 2. أضف التغييرات
git add .

# 3. التزم بالتغييرات
git commit -m "وصف التغييرات هنا"

# 4. ارفع إلى GitHub
git push origin main

# ⏳ GitHub Actions سيبدأ تلقائياً
# انتظر 5-10 دقائق حتى انتهاء البناء
```

### مثال عملي:
```bash
# تعديل ملف
nano AliCounter/ContentView.swift

# إضافة وحفظ
git add AliCounter/ContentView.swift
git commit -m "تحديث واجهة العداد"
git push origin main

# اذهب إلى https://github.com/alicfhnn1999-cyber/21Q/actions
# ستجد البناء الجديد جاري 🔄
```

## 🐛 استكشاف الأخطاء

### المشكلة: "Xcode not found"
```bash
xcode-select --reset
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

### المشكلة: "Build Failed"
```bash
# حل 1: نظف البناء
cd AliCounter
rm -rf build
xcodebuild clean

# حل 2: حذف Derived Data
rm -rf ~/Library/Developer/Xcode/DerivedData/*

# حل 3: أعد فتح Xcode
```

### المشكلة: "Code Signing Error"
```bash
# في GitHub Actions، هذا يتم التعامل معه تلقائياً
# على جهازك المحلي، استخدم:
xcodebuild ... CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
```

### المشكلة: "Simulator not responding"
```bash
xcrun simctl erase all
killall com.apple.CoreSimulator.CoreSimulatorService
```

## 📁 هيكل المشروع الكامل

```
21Q/
├── AliCounter/
│   ├── AliCounterApp.swift           # نقطة الدخول الرئيسية
│   ├── ContentView.swift              # الواجهة والمنطق
│   ├── AliCounter.xcodeproj/          # ملف المشروع
│   │   ├── project.pbxproj            # إعدادات البناء
│   │   └── xcshareddata/              # الإعدادات المشتركة
│   ├── ExportOptions.plist            # خيارات التصدير
│   ├── Assets.xcassets/               # الموارد والصور
│   └── Preview Content/               # محتوى المعاينة
├── .github/
│   └── workflows/
│       └── build-ios.yml              # سير العمل التلقائي ⭐
├── README.md                           # توثيق المشروع
├── SETUP.md                            # هذا الملف
└── .gitignore                          # ملفات التجاهل
```

## ✅ قائمة التحقق (Checklist)

### قبل التطوير المحلي:
- [ ] تم تثبيت macOS 11+
- [ ] تم تثبيت Xcode
- [ ] تم تثبيت Git
- [ ] تم تثبيت p7zip

### قبل أول Push:
- [ ] تم استنساخ المستودع
- [ ] تم فتح المشروع في Xcode
- [ ] تم اختبار على المحاكاة (Cmd+R)
- [ ] لا توجد أخطاء بناء

### بعد Push:
- [ ] ذهبت إلى https://github.com/alicfhnn1999-cyber/21Q/actions
- [ ] البناء في حالة "جاري" 🔄 أو "ناجح" ✅
- [ ] حمّلت الـ Artifact بعد اكتمال البناء

## 📚 موارد إضافية

- [Apple Developer Documentation](https://developer.apple.com/documentation/)
- [SwiftUI Guide](https://developer.apple.com/tutorials/SwiftUI)
- [Xcode Help](https://help.apple.com/xcode/)
- [GitHub Actions for iOS](https://github.com/actions/setup-xcode)

---

**تم إنشاء هذا الدليل لمساعدتك في تطوير واستخدام مشروع AliCounter بسهولة** ✨
