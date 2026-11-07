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

/**
 * 测试用例：SUB_ACE_UI_COMPONENT_TEXTINPUT_SEARCH_TV_FOCUS_0310
 * 测试目的：验证textinput/search在切换镜像语言后的走焦功能
 * 前置条件：
 *   1. TV环境正常
 *   2. 语言切换为维语（镜像语言）
 * 预期结果：镜像语言下，走焦功能正常
 */

@Entry
@ComponentV2
export struct TextinputSearchFocus0310 {
  @Local textInputValue1: string = '';
  @Local textInputValue2: string = '';
  @Local searchValue: string = '';
  @Local currentFocus: string = '无';
  @Local focusHistory: string[] = [];

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('SUB_ACE_UI_COMPONENT_TEXTINPUT_SEARCH_TV_FOCUS_0310')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)

        Text('TextInput/Search 镜像语言走焦测试')
          .fontSize(13)
          .fontColor(Color.Gray)

        Divider()

        // 前置条件
        Column({ space: 8 }) {
          Text('⚠️ 前置条件：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Orange)
            .alignSelf(ItemAlign.Start)

          Text('1. 确保在TV设备上运行')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('2. 系统语言切换为维语（RTL镜像语言）')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('设置路径：设置 → 系统 → 语言 → 维吾尔语')
            .fontSize(11)
            .fontColor(Color.Blue)
            .alignSelf(ItemAlign.Start)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#FFF3E0')
        .borderRadius(8)

        Divider()

        // 当前焦点状态
        Column({ space: 5 }) {
          Text(`当前焦点：${this.currentFocus}`)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)

          Text(`走焦历史：${this.focusHistory.join(' → ') || '无'}`)
            .fontSize(11)
            .fontColor(Color.Gray)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#E3F2FD')
        .borderRadius(8)

        // 可走焦组件区域
        Column({ space: 15 }) {
          Text('可走焦组件（使用遥控器方向键测试）：')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          // TextInput 1
          Column({ space: 5 }) {
            Text('TextInput 1：')
              .fontSize(12)
              .alignSelf(ItemAlign.Start)

            TextInput({ text: this.textInputValue1, placeholder: 'TextInput输入框1' })
              .id('textInput1')
              .width('100%')
              .height(45)
              .backgroundColor(this.currentFocus === 'TextInput1' ? '#BBDEFB' : Color.White)
              .borderWidth(this.currentFocus === 'TextInput1' ? 2 : 1)
              .borderColor(this.currentFocus === 'TextInput1' ? '#2196F3' : '#CCCCCC')
              .onFocus(() => {
                this.currentFocus = 'TextInput1';
                this.focusHistory.push('TI1');
              })
          }

          // TextInput 2
          Column({ space: 5 }) {
            Text('TextInput 2：')
              .fontSize(12)
              .alignSelf(ItemAlign.Start)

            TextInput({ text: this.textInputValue2, placeholder: 'TextInput输入框2' })
              .id('textInput2')
              .width('100%')
              .height(45)
              .backgroundColor(this.currentFocus === 'TextInput2' ? '#BBDEFB' : Color.White)
              .borderWidth(this.currentFocus === 'TextInput2' ? 2 : 1)
              .borderColor(this.currentFocus === 'TextInput2' ? '#2196F3' : '#CCCCCC')
              .onFocus(() => {
                this.currentFocus = 'TextInput2';
                this.focusHistory.push('TI2');
              })
          }

          // Search
          Column({ space: 5 }) {
            Text('Search：')
              .fontSize(12)
              .alignSelf(ItemAlign.Start)

            Search({ value: this.searchValue, placeholder: 'Search搜索框' })
              .id('searchInput')
              .width('100%')
              .height(45)
              .backgroundColor(this.currentFocus === 'Search' ? '#C8E6C9' : Color.White)
              .onFocus(() => {
                this.currentFocus = 'Search';
                this.focusHistory.push('Search');
              })
          }

          // 普通Button用于对比
          Button('普通按钮（对比走焦）')
            .id('normalBtn')
            .width('100%')
            .height(45)
            .backgroundColor(this.currentFocus === 'Button' ? '#FFE0B2' : '#FF9800')
            .onFocus(() => {
              this.currentFocus = 'Button';
              this.focusHistory.push('Btn');
            })
        }
        .width('100%')
        .padding(15)
        .backgroundColor('#FAFAFA')
        .borderRadius(8)

        // 清除历史按钮
        Button('清除走焦历史')
          .id('clearBtn')
          .width('60%')
          .height(40)
          .backgroundColor('#607d7B')
          .onClick(() => {
            this.focusHistory = [];
          })

        Divider()

        // 测试说明
        Column({ space: 8 }) {
          Text('测试步骤：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          Text('1. 确保已切换为镜像语言（维语）')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('2. 使用遥控器上下左右键在组件间走焦')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('3. 观察焦点是否按正确方向移动')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('4. RTL模式下，左右键方向应反转')
            .fontSize(12)
            .fontColor(Color.Orange)
            .alignSelf(ItemAlign.Start)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)

        // 预期结果
        Column({ space: 5 }) {
          Text('预期结果：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          Text('镜像语言下，走焦功能正常，焦点按预期方向移动')
            .fontSize(12)
            .fontColor(Color.Green)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#E8F5E9')
        .borderRadius(8)
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}
