/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct PopupPage {
  @State popupVisible: boolean = false
  @State lastFocusedId: string = '' // 记录最后获焦组件ID
  @State inputText: string = ''

  // 自定义气泡组件
  @Builder CustomPopupContent() {
    Column() {
      Button('Popup按钮')
        .id('popupBtn')
        .width(200)
        .backgroundColor(this.getFocusColor('popupBtn')) // 焦点颜色反馈
        .onFocus(() => this.lastFocusedId = 'popupBtn')

      TextInput({ placeholder: '输入内容' })
        .id('popupInput')
        .backgroundColor(this.getFocusColor('popupInput')) // 焦点颜色反馈
        .onFocus(() => this.lastFocusedId = 'popupInput')
    }
    .padding(20)
    .onAppear(() => {
      // 气泡显示时自动聚焦首元素
      focusControl.requestFocus('popupButton')
    })
    .onDisAppear(() => {
      // 气泡关闭时返回原焦点
      focusControl.requestFocus(this.lastFocusedId)
    })
  }

  build() {
    Column() {
      TextInput({ placeholder: '主页面输入框' })
        .id('mainInput')
        .backgroundColor(this.getFocusColor('mainInput')) // 焦点颜色反馈
        .width('90%')
        .margin(20)
        .onEditChange((status: boolean) => this.inputText = 'inputText: ' + status)
        .onFocus(() => this.lastFocusedId = 'mainInput')

      Button('打开弹窗')
        .onClick(() => {
          this.popupVisible = true
          focusControl.requestFocus('popupBtn') // 弹窗打开时聚焦首元素
        })
        .bindPopup(this.popupVisible, {
          builder: this.CustomPopupContent,
          focusable: true,
        })
    }
    .width('100%')
  }

  private getFocusColor(id: string): string {
    return this.lastFocusedId === id ? '#E3F2FD' : '#FFFFFF' // 蓝色为获焦态
  }
}