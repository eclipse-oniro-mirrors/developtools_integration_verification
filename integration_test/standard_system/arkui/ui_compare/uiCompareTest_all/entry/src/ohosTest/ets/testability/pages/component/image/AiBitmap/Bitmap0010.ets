/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
@ComponentV2
export struct Bitmap0010 {
  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_AI_BITMAP_0010`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：页面中无Image加载的位图`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`测试步骤：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(`1. 进入noimage页面`)
          .fontSize(12)
          .width('100%')

        Text(`2. 双指长按唤出小艺`)
          .fontSize(12)
          .width('100%')

        Text(`3. 点击右下角按钮进行提取图片`)
          .fontSize(12)
          .width('100%')

        Divider()

        Text(`预期结果：无提取图片选项`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        // 页面只有纯文本，没有Image组件
        Column({ space: 20 }) {
          Text('这是一个没有图片的页面')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)

          Text('页面内容：')
            .fontSize(14)
            .width('100%')

          Text('• 只有文本内容')
            .fontSize(12)
            .width('100%')

          Text('• 没有Image组件')
            .fontSize(12)
            .width('100%')

          Text('• 没有任何位图资源')
            .fontSize(12)
            .width('100%')

          Divider()

          Text('测试方法：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .width('100%')
            .margin({ top: 20 })

          Text('1. 双指长按页面空白区域')
            .fontSize(12)
            .width('100%')

          Text('2. 唤出小艺助手')
            .fontSize(12)
            .width('100%')

          Text('3. 点击右下角提取图片按钮')
            .fontSize(12)
            .width('100%')

          Text('4. 确认没有提取图片的选项')
            .fontSize(12)
            .width('100%')
            .fontColor(Color.Green)

          Rect()
            .width(200)
            .height(150)
            .fill(Color.White)
            .stroke(Color.Gray)
            .strokeWidth(2)
            .margin({ top: 20 })

          Text('↑ 这是一个矩形，不是图片')
            .fontSize(11)
            .fontColor(Color.Gray)
        }
        .width('100%')
        .layoutWeight(1)
        .padding(20)
        .backgroundColor(Color.White)
        .borderRadius(8)
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

