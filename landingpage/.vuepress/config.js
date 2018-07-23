module.exports = {
  title: 'JustYib',
  description: 'JustYib landing pages',
  base: '/kcapstone-final-project/',
  themeConfig: {
    locales: {
      '/': {
        selectText: 'ภาษา',
        label: 'ไทย',
        nav: [{
            text: 'หน้าหลัก',
            link: '/'
          },
          {
            text: 'Android',
            link: '/Android.html'
          },
          {
            text: 'iOS',
            link: '/iOS.html'
          },
          {
            text: 'ทีมงาน',
            link: '/Teams.html'
          },
          {
            text: 'เฟสบุ๊ค',
            link: 'http://fb.com/JustYibOfficial'
          }
        ],
      },
      '/en/': {
        // text for the language dropdown
        selectText: 'Languages',
        // label for this locale in the language dropdown
        label: 'English',
        // algolia docsearch options for current locale
        nav: [{
            text: 'Home',
            link: '/en/'
          },
          {
            text: 'Android',
            link: '/en/Android.html'
          },
          {
            text: 'iOS',
            link: '/en/iOS.html'
          },
          {
            text: 'Team',
            link: '/en/Teams.html'
          },
          {
            text: 'Facebook',
            link: 'http://fb.com/JustYibOfficial'
          }
        ],
      }
    }
  },
  locales: {
    // The key is the path for the locale to be nested under.
    // As a special case, the default locale can use '/' as its path.
    '/': {
      lang: 'th-TH',
      title: 'จัสหยิบ',
      description: 'หน้าเริ่มต้นของ JustYib'
    },
    '/en/': {
      lang: 'en-US', // this will be set as the lang attribute on <html>
      title: 'JustYib',
      description: 'JustYib landing pages',
    }
  },
}