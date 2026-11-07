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

import { Chip, SymbolGlyphModifier, ChipSize } from '@kit.ArkUI';

@Entry
@Component
struct TextChipSymbol0220 {
  @State isActivated: boolean = false;
  @State useCustomEffect: boolean = false;

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('基础属性测试')
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
          // 测试说明
          Column() {
            Text('测试说明')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Text('本测试用例验证Chip组件的prefixSymbol和suffixSymbol自定义动效场景')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ bottom: 10 })

            Column() {
              Text('预置条件:')
                .fontSize(13)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 5 })

              Text('1. 创建chip组件')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('2. 设置prefixSymbol和suffixSymbol属性（normal、activated）')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('3. 设置fontSize属性、fontColor属性，fontColor([xx])、fontWeight属性')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('4. 传入symbol图标为normal：sys.symbol.ohos_folder_badge_plus；activated：sys.symbol.ohos_trash')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#FFF3E0')
            .borderRadius(8)
            .margin({ bottom: 10 })

            Column() {
              Text('测试步骤:')
                .fontSize(13)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 5 })

              Text('1. chip组件，HM Symbol自设置动效')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#E3F2FD')
            .borderRadius(8)
            .margin({ bottom: 10 })

            Column() {
              Text('预期结果:')
                .fontSize(13)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 5 })

              Text('1. 只考虑组件默认动效，开发者手动设置动效不生效')
                .fontSize(12)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Medium)
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#E8F5E9')
            .borderRadius(8)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(12)
          .shadow({ radius: 8, color: '#1F000000', offsetX: 0, offsetY: 2 })

          // 当前状态显示
          Column() {
            Text('当前状态')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Row() {
              Text('激活状态: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(this.isActivated ? 'Activated' : 'Normal')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor(this.isActivated ? '#4CAF50' : '#2196F3')
            }
            .width('100%')
            .margin({ bottom: 8 })

            Row() {
              Text('动效模式: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(this.useCustomEffect ? '自定义动效(不生效)' : '默认动效')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FF9800')
            }
            .width('100%')
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(12)
          .shadow({ radius: 8, color: '#1F000000', offsetX: 0, offsetY: 2 })

          // 默认动效测试区域
          Column() {
            Text('默认动效')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            Text('使用组件默认动效，无自定义动效设置')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ bottom: 10 })

            // Chip组件展示 - 默认动效
            Column() {
              Chip({
                prefixSymbol: {
                  normal: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))
                    .fontSize(30)
                    .fontColor([Color.Blue])
                    .fontWeight(FontWeight.Bold),
                  activated: new SymbolGlyphModifier($r('sys.symbol.ohos_trash'))
                    .fontSize(30)
                    .fontColor([Color.Green])
                    .fontWeight(FontWeight.Bold)
                },
                suffixSymbol: {
                  normal: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))
                    .fontSize(30)
                    .fontColor([Color.Blue])
                    .fontWeight(FontWeight.Bold),
                  activated: new SymbolGlyphModifier($r('sys.symbol.ohos_trash'))
                    .fontSize(30)
                    .fontColor([Color.Green])
                    .fontWeight(FontWeight.Bold)
                },
                label: {
                  text: 'Chip组件测试'
                },
                size: ChipSize.NORMAL,
                activated: this.isActivated
              })
            }
            .width('100%')
            .padding(20)
            .backgroundColor('#F5F5F5')
            .borderRadius(8)
            .justifyContent(FlexAlign.Center)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(12)
          .shadow({ radius: 8, color: '#1F000000', offsetX: 0, offsetY: 2 })

          // 尝试自定义动效测试区域(验证不生效)
          Column() {
            Text('尝试设置自定义动效')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            Text('代码中尝试通过.symbolEffect()设置自定义动效')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ bottom: 5 })

            Text('预期: 自定义动效不生效,仍使用组件默认动效')
              .fontSize(12)
              .fontColor('#FF5722')
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 10 })

            // Chip组件展示 - 尝试自定义动效(验证不生效)
            Column() {
              Chip({
                prefixSymbol: {
                  normal: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))
                    .fontSize(30)
                    .fontColor([Color.Blue])
                    .fontWeight(FontWeight.Bold)
                    .symbolEffect(1), // ⚠️ 尝试设置自定义动效,预期不生效
                  activated: new SymbolGlyphModifier($r('sys.symbol.ohos_trash'))
                    .fontSize(30)
                    .fontColor([Color.Green])
                    .fontWeight(FontWeight.Bold)
                    .symbolEffect(1) // ⚠️ 尝试设置自定义动效,预期不生效
                },
                suffixSymbol: {
                  normal: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))
                    .fontSize(30)
                    .fontColor([Color.Blue])
                    .fontWeight(FontWeight.Bold)
                    .symbolEffect(1), // ⚠️ 尝试设置自定义动效,预期不生效
                  activated: new SymbolGlyphModifier($r('sys.symbol.ohos_trash'))
                    .fontSize(30)
                    .fontColor([Color.Green])
                    .fontWeight(FontWeight.Bold)
                    .symbolEffect(1) // ⚠️ 尝试设置自定义动效,预期不生效
                },
                label: {
                  text: 'Chip组件测试'
                },
                size: ChipSize.NORMAL,
                activated: this.isActivated
              })
            }
            .width('100%')
            .padding(20)
            .backgroundColor('#FFEBEE')
            .borderRadius(8)
            .justifyContent(FlexAlign.Center)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(12)
          .shadow({ radius: 8, color: '#1F000000', offsetX: 0, offsetY: 2 })

          // 测试结论
          Column() {
            Text('📋 测试结论')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Text('对比上下两个Chip组件:')
              .fontSize(13)
              .fontColor('#333333')
              .margin({ bottom: 8 })

            Row() {
              Text('✓ ')
                .fontSize(14)
                .fontColor('#4CAF50')
              Text('动效表现完全一致')
                .fontSize(13)
                .fontColor('#666666')
            }
            .width('100%')
            .margin({ bottom: 5 })

            Row() {
              Text('✓ ')
                .fontSize(14)
                .fontColor('#4CAF50')
              Text('开发者设置的.symbolEffect()未生效')
                .fontSize(13)
                .fontColor('#666666')
            }
            .width('100%')
            .margin({ bottom: 5 })

            Row() {
              Text('✓ ')
                .fontSize(14)
                .fontColor('#4CAF50')
              Text('Chip组件只使用默认动效')
                .fontSize(13)
                .fontColor('#666666')
            }
            .width('100%')
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#E8F5E9')
          .borderRadius(12)
          .shadow({ radius: 8, color: '#1F000000', offsetX: 0, offsetY: 2 })

          // 控制按钮
          Column({ space: 10 }) {
            Button('改变激活状态')
              .id('changeStateButton')
              .fontSize(16)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .width('90%')
              .height(48)
              .onClick(() => {
                this.isActivated = !this.isActivated;
                console.info(`[TextChipSymbol0220] 激活状态切换为: ${this.isActivated ? 'Activated' : 'Normal'}`);
              })

            Button('重置测试')
              .fontSize(16)
              .backgroundColor('#FF9800')
              .fontColor('#FFFFFF')
              .width('90%')
              .height(48)
              .onClick(() => {
                this.isActivated = false;
                this.useCustomEffect = false;
                console.info('[TextChipSymbol0220] 测试已重置');
              })
          }
          .width('100%')
          .alignItems(HorizontalAlign.Center)
          .margin({ top: 10 })

          // 测试提示
          Column() {
            Text('💡 测试提示')
              .fontSize(13)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF9800')
              .margin({ bottom: 8 })

            Text('• 第一个组件: 未设置自定义动效,使用默认动效')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• 第二个组件: 代码中调用.symbolEffect(1)尝试设置自定义动效')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• 验证结果: 两个组件动效表现完全一致')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• 结论: 开发者手动设置的动效不生效,只使用默认动效')
              .fontSize(11)
              .fontColor('#FF5722')
              .fontWeight(FontWeight.Medium)
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• 点击"改变激活状态"观察状态切换动效')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• normal状态显示文件夹图标(蓝色)')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• activated状态显示垃圾桶图标(绿色)')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
          }
          .width('90%')
          .padding(12)
          .backgroundColor('#FFF8E1')
          .borderRadius(8)
          .margin({ top: 15, bottom: 30 })
        }
        .width('100%')
        .padding({ top: 20, bottom: 20 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

