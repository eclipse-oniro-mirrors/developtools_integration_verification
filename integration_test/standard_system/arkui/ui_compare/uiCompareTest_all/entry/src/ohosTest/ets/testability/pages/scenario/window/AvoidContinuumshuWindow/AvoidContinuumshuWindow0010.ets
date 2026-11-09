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
struct AvoidContinuumshuWindow0010 {
  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({ content: '菜单项1' })
        .onClick(() => {
          console.log('点击了菜单项1')
        })
      MenuItem({ content: '菜单项2' })
        .onClick(() => {
          console.log('点击了菜单项2')
        })
      MenuItem({ content: '菜单项3' })
        .onClick(() => {
          console.log('点击了菜单项3')
        })
    }
  }

  build() {
    Column() {
      Text('验证菜单bindmenu的连续弹子窗场景')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 50, bottom: 30 })

      Button('点击弹出菜单')
        .id('avoid_continuumshu_button_0010')
        .width(200)
        .height(50)
        .fontSize(16)
        .bindMenu(this.MenuBuilder, {
          showInSubWindow: true
        })
        .margin({ bottom: 20 })

      Text('说明：点击按钮弹出子窗菜单，然后连续点击蒙层处关闭菜单')
        .fontSize(14)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({ top: 20 })
        .padding(20)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}


