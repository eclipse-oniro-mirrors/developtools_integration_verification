/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct SetAutofocusTransferFocusview0160 {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack()
  @State inputText: string = ''
  @State focusLog: string = ''

  @Builder
  navDestinationBuilder(name: string) {
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0160')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('Navigation(navbar, navdestination)场景测试')
        .id('setautofocustransfer_focusview_0160_nav_test')
        .width('90%')
        .height(20)

      Navigation(this.navPathStack) {
        Column() {
          TextInput({ placeholder: '请输入内容', text: this.inputText })
            .id('setautofocustransfer_focusview_0160_textinput')
            .width('90%')
            .height(50)
            .defaultFocus(false)
            .onChange((value: string) => {
              this.inputText = value
            })
            .onFocus(() => {
              this.focusLog = 'Navigation_TextInput Gain TestFocus'
              console.log('Navigation_TextInput Gain TestFocus')
            })
            .onBlur(() => {
              this.focusLog = 'Navigation_TextInput Lost TestFocus'
              console.log('Navigation_TextInput Lost TestFocus')
            })

          Text(this.focusLog)
            .id('setautofocustransfer_focusview_0160_log')
            .fontSize(14)
            .fontColor(Color.Blue)
            .margin({ bottom: 5 })
        }
        .width('100%')
        .height('80%')
        .justifyContent(FlexAlign.Center)
      }
      .navDestination(this.navDestinationBuilder)
      .mode(NavigationMode.Stack)
      .width('100%')
      .height('70%')
      .title('Navigation标题')
      .menus([
        {
          value: '菜单1',
          icon: 'resources/base/media/icon.png',
          action: () => {
            console.log('菜单1被点击')
          }
        },
        {
          value: '菜单2',
          icon: 'resources/base/media/icon.png',
          action: () => {
            console.log('菜单2被点击')
          }
        },
        {
          value: '菜单3',
          icon: 'resources/base/media/icon.png',
          action: () => {
            console.log('菜单3被点击')
          }
        },
        {
          value: '更多',
          icon: 'resources/base/media/icon.png',
          action: () => {
            console.log('更多被点击')
          }
        }
      ])
      .toolbarConfiguration([
        {
          value: 'Navbar1',
          icon: 'resources/base/media/icon.png',
          action: () => {
            console.log('Navbar1被点击')
          }
        },
        {
          value: 'Navbar2',
          icon: 'resources/base/media/icon.png',
          action: () => {
            console.log('Navbar2被点击')
          }
        }
      ])
    }
    .width('100%')
    .height('100%')
  }
}

