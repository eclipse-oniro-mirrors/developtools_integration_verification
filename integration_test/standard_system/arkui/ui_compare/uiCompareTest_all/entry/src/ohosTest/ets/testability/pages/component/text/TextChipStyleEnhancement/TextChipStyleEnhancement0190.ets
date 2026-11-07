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

import { Chip, ChipSize } from '@kit.ArkUI';

@Entry
@Component
struct TextChipStyleEnhancement0190 {
  @State stepStatus: string = '查看第5个Chip的未激活状态';

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('未激活Chip状态测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
      }
      .width('100%')
      .height('4.59%')
      .backgroundColor('#2196F3')
      .justifyContent(FlexAlign.Center)

      Scroll() {
        Column({ space: 20 }) {
          // 当前状态显示
          Column() {
            Text('测试说明')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Text(this.stepStatus)
              .fontSize(14)
              .fontColor('#2196F3')
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 10 })

            Text('本测试用例验证未设置activated属性时Chip的默认状态')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ bottom: 5 })

            Text('预期结果: 背景灰色，字体绿色，图标橘色')
              .fontSize(12)
              .fontColor('#4CAF50')
              .fontWeight(FontWeight.Bold)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#F5F5F5')
          .borderRadius(10)
          .margin({ top: 20 })

          // Chip展示区域
          Column() {
            Text('Chip展示区域')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            // 第1个Chip - 参考（已激活）
            Column() {
              Text('第1个Chip (参考-已激活)')
                .fontSize(12)
                .fontColor('#999999')
                .margin({ bottom: 8 })

              Chip({
                prefixIcon: {
                  src: $r('sys.media.ohos_ic_public_ok'),
                  size: { width: 16, height: 16 },
                  fillColor: Color.Yellow,
                  activatedFillColor: Color.Yellow
                },
                label: {
                  text: 'Chip 1 (已激活)',
                  fontColor: Color.White,
                  activatedFontColor: Color.White
                },
                suffixIcon: {
                  src: $r('sys.media.ohos_ic_public_cancel'),
                  size: { width: 16, height: 16 },
                  fillColor: Color.Yellow,
                  activatedFillColor: Color.Yellow
                },
                size: ChipSize.NORMAL,
                allowClose: false,
                activated: true,
                backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
                activatedBackgroundColor: '#2196F3'
              })

              Text('参考: 已激活状态 (背景蓝色，字体白色，图标黄色)')
                .fontSize(11)
                .fontColor('#666666')
                .margin({ top: 5 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(10)
            .backgroundColor('#E3F2FD')
            .borderRadius(8)
            .margin({ bottom: 15 })

            // 第2个Chip - 参考（未激活）
            Column() {
              Text('第2个Chip (参考-未激活)')
                .fontSize(12)
                .fontColor('#999999')
                .margin({ bottom: 8 })

              Chip({
                prefixIcon: {
                  src: $r('sys.media.ohos_ic_public_ok'),
                  size: { width: 16, height: 16 },
                  fillColor: Color.Red,
                  activatedFillColor: Color.Yellow
                },
                label: {
                  text: 'Chip 2 (未激活)',
                  fontColor: Color.Black,
                  activatedFontColor: Color.White
                },
                suffixIcon: {
                  src: $r('sys.media.ohos_ic_public_cancel'),
                  size: { width: 16, height: 16 },
                  fillColor: Color.Red,
                  activatedFillColor: Color.Yellow
                },
                size: ChipSize.NORMAL,
                allowClose: false,
                activated: false,
                backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
                activatedBackgroundColor: '#2196F3'
              })

              Text('参考: 未激活状态 (背景灰色，字体黑色，图标红色)')
                .fontSize(11)
                .fontColor('#666666')
                .margin({ top: 5 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(10)
            .backgroundColor('#FFF3E0')
            .borderRadius(8)
            .margin({ bottom: 15 })

            // 第3个Chip - 参考（默认状态）
            Column() {
              Text('第3个Chip (参考-默认)')
                .fontSize(12)
                .fontColor('#999999')
                .margin({ bottom: 8 })

              Chip({
                prefixIcon: {
                  src: $r('sys.media.ohos_ic_public_ok'),
                  size: { width: 16, height: 16 },
                  fillColor: Color.Red
                },
                label: {
                  text: 'Chip 3 (默认)'
                },
                suffixIcon: {
                  src: $r('sys.media.ohos_ic_public_cancel'),
                  size: { width: 16, height: 16 },
                  fillColor: Color.Red
                },
                size: ChipSize.NORMAL,
                allowClose: false,
                backgroundColor: $r('sys.color.ohos_id_color_button_normal')
              })

              Text('参考: 默认状态 (未设置activated)')
                .fontSize(11)
                .fontColor('#666666')
                .margin({ top: 5 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(10)
            .backgroundColor('#F5F5F5')
            .borderRadius(8)
            .margin({ bottom: 15 })

            // 第4个Chip - 参考（明确颜色的默认状态）
            Column() {
              Text('第4个Chip (参考-明确颜色)')
                .fontSize(12)
                .fontColor('#999999')
                .margin({ bottom: 8 })

              Chip({
                prefixIcon: {
                  src: $r('sys.media.ohos_ic_public_ok'),
                  size: { width: 16, height: 16 },
                  fillColor: Color.Blue
                },
                label: {
                  text: 'Chip 4 (明确颜色)',
                  fontColor: Color.Red
                },
                suffixIcon: {
                  src: $r('sys.media.ohos_ic_public_cancel'),
                  size: { width: 16, height: 16 },
                  fillColor: Color.Blue
                },
                size: ChipSize.NORMAL,
                allowClose: false,
                backgroundColor: Color.Yellow
              })

              Text('参考: 明确设置颜色 (背景黄色，字体红色，图标蓝色)')
                .fontSize(11)
                .fontColor('#666666')
                .margin({ top: 5 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(10)
            .backgroundColor('#FFFDE7')
            .borderRadius(8)
            .margin({ bottom: 15 })

            Divider()
              .margin({ top: 10, bottom: 10 })

            // 第5个Chip - 测试目标（未设置activated）
            Column() {
              Text('第5个Chip (测试目标)')
                .fontSize(14)
                .fontColor('#FF5722')
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 8 })

              Chip({
                prefixIcon: {
                  src: $r('sys.media.ohos_ic_public_ok'),
                  size: { width: 16, height: 16 },
                  fillColor: '#FFA500' // 橘色
                },
                label: {
                  text: 'Chip 5 (未设置activated)',
                  fontColor: '#4CAF50' // 绿色
                },
                suffixIcon: {
                  src: $r('sys.media.ohos_ic_public_cancel'),
                  size: { width: 16, height: 16 },
                  fillColor: '#FFA500' // 橘色
                },
                size: ChipSize.NORMAL,
                allowClose: false,
                backgroundColor: '#E0E0E0' // 灰色
              })

              Text('✓ 预期: 背景灰色，字体绿色，图标橘色')
                .fontSize(12)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Bold)
                .margin({ top: 8 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(15)
            .backgroundColor('#E8F5E9')
            .borderRadius(8)
            .border({ width: 2, color: '#4CAF50' })
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(10)
          .border({ width: 1, color: '#E0E0E0' })

          // 预期结果说明
          Column() {
            Text('预期结果验证')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            Column() {
              Text('第5个Chip预期:')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 8 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('背景颜色: 灰色 (#e0e0e0)')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 5 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('字体颜色: 绿色 (#4caf50)')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 5 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('图标填充: 橘色 (#ffa500)')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 5 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('状态: 未设置activated属性')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#E8F5E9')
            .borderRadius(8)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#F5F5F5')
          .borderRadius(10)
          .margin({ bottom: 30 })
        }
        .width('100%')
        .padding({ left: 16, right: 16 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}

