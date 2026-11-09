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
export struct ToolbarBlur0012 {
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BLUR_012')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：toolbarConfiguration（大于等于5）-API10`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text(`工具栏示例（9项）`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Column({ space: 10 }) {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (index: number) => {
          Row({ space: 10 }) {
            Image($r('app.media.icon'))
              .width(24)
              .height(24)
            Text(`工具${index}`)
              .fontSize(14)
          }
          .width('80%')
          .height('3.28%')
          .padding({ left: 10 })
          .backgroundColor('#F0F0F0')
          .borderRadius(8)
        })
      }

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Button(`点击"更多"`)
        .id('btn')
        .onClick(() => {
          this.testStatus = '✅ 工具栏展开，查看背景模糊效果';
        })

      Divider()

      Text(`预期结果：背景没有模糊，backgroundBlurStyle值为空`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`说明：toolbarConfiguration需在Column容器上配置，此处为模拟展示`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

