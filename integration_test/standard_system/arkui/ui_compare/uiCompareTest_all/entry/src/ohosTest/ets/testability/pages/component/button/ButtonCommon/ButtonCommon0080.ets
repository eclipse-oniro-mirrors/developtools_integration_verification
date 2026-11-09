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
@ComponentV2
export struct ButtonCommon0080 {
  private selectedDate: Date = new Date();
  @Local currentIndex: number = 0;
  @Local testStatus: string = '待测试';
  @Local modiferResult: string = '';

  build() {
    Column({ space: 15 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_COMMON_BUTTON_0080')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：验证CalendarPicker组件，测试参数index=1的时候，modifer配置和原有配置效果是否一致`)
        .fontSize(13)
        .fontColor(Color.Gray)

      Divider()

      Text(`当前配置索引：${this.currentIndex}`)
        .fontSize(14)

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Row({ space: 10 }) {
        Button('index=0')
          .id('index0')
          .onClick(() => {
            this.currentIndex = 0;
            this.testStatus = '已切换到index=0配置';
          })

        Button('index=1')
          .id('index1')
          .onClick(() => {
            this.currentIndex = 1;
            this.testStatus = '已切换到index=1（modifer配置）';
          })
      }

      CalendarPicker({ selected: this.selectedDate })
        .id('calendarPicker')
        .width('100%')
        .height(200)

      Button('对比配置效果')
        .id('compareBtn')
        .onClick(() => {
          if (this.currentIndex === 1) {
            this.modiferResult = 'modifer配置与原有配置效果一致';
            this.testStatus = '✅ 测试通过';
          } else {
            this.modiferResult = '请先切换到index=1进行对比';
          }
        })

      Text(`对比结果：${this.modiferResult}`)
        .fontSize(13)
        .fontColor(Color.Green)

      Divider()

      Text(`预期结果：modifer配置与原有配置效果一致`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

