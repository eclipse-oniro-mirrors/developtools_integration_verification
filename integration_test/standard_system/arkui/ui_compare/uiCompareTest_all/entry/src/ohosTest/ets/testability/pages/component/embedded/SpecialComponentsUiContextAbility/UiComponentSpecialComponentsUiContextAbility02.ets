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

import { router, UIContext } from '@kit.ArkUI';

import { common } from '@kit.AbilityKit';

@Entry
@Component
struct UiComponentSpecialComponentsUiContextAbility02 {
  @State buttonScale: number = 1;
  @State cacheDir: string = '点击按钮获取';
  @State getStatus: string = '未获取';
  @State statusColor: Color = Color.Grey;
  private uiContext: UIContext | null | undefined = undefined;

  aboutToAppear(): void {
    console.info('Index: aboutToAppear - 页面加载');
    // 获取UIContext
    this.uiContext = this.getUIContext();
  }

  build() {
    Column({ space: 10 }) {
      // 标题区域
      Column({ space: 5 }) {
        Text('UIContext测试')
          .fontSize(22)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .fontColor('#182431')
          .letterSpacing(1.2)

        Text('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0020')
          .fontSize(11)
          .fontColor('#99182431')
          .fontStyle(FontStyle.Italic)
          .fontFamily('Courier')
          .letterSpacing(0.5)

        Divider()
          .strokeWidth(1.5)
          .color('#E5E5E5')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#FAFAFA')
      .shadow({ radius: 6, color: '#00000015', offsetX: 0, offsetY: 3 })
      .borderRadius({ bottomLeft: 12, bottomRight: 12 })

      Scroll() {
        Column({ space: 15 }) {
          // 测试说明
          Column({ space: 8 }) {
            Text('✦ 测试场景')
              .fontSize(16)
              .fontStyle(FontStyle.Italic)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Text('在单例模式下cacheDir的getHostContext获取缓存目录')
              .fontSize(13)
              .fontColor('#666666')
              .width('100%')
              .lineHeight(20)
              .fontStyle(FontStyle.Italic)
              .padding(10)
              .backgroundColor('#FFF8E1')
              .borderRadius(6)
              .border({ width: 1.5, color: '#FFE082' })
          }
          .width('95%')
          .alignItems(HorizontalAlign.Start)

          // 缓存目录显示
          Column({ space: 8 }) {
            Text('✦ 缓存目录（cacheDir）')
              .fontSize(16)
              .fontStyle(FontStyle.Italic)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Column({ space: 10 }) {
              // 获取状态
              Row({ space: 10 }) {
                Text('状态：')
                  .fontSize(13)
                  .fontColor('#666666')
                  .fontStyle(FontStyle.Italic)
                  .width(60)

                Text(this.getStatus)
                  .fontSize(13)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(this.statusColor)
                  .layoutWeight(1)
                  .fontStyle(FontStyle.Italic)
              }
              .width('100%')

              Divider()
                .strokeWidth(1)
                .color('#E0E0E0')

              // cacheDir
              Row({ space: 10 }) {
                Text('cacheDir：')
                  .fontSize(13)
                  .fontStyle(FontStyle.Italic)
                  .fontColor('#666666')
                  .fontWeight(FontWeight.Medium)
                  .width(120)

                Text(this.cacheDir)
                  .fontSize(12)
                  .fontColor('#182431')
                  .fontFamily('Courier')
                  .layoutWeight(1)
                  .maxLines(3)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .wordBreak(WordBreak.BREAK_ALL)
              }
              .width('100%')
              .alignItems(VerticalAlign.Top)
            }
            .width('100%')
            .padding(12)
            .backgroundColor('#F5F5F5')
            .borderRadius(8)
            .border({ width: 2, color: '#E0E0E0', style: BorderStyle.Dashed })
          }
          .width('95%')
          .alignItems(HorizontalAlign.Start)

          // 操作步骤
          Column({ space: 8 }) {
            Text('✦ 操作步骤')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Column({ space: 5 }) {
              Text('1. 页面加载时通过getUIContext()获取UIContext')
                .fontSize(13)
                .fontColor('#666666')
                .width('100%')

              Text('2. 点击下方"获取缓存目录"按钮')
                .fontSize(13)
                .fontColor('#666666')
                .width('100%')

              Text('3. 通过uiContext.getHostContext()获取Context')
                .fontSize(13)
                .fontColor('#666666')
                .width('100%')

              Text('4. 同时使用getContext(this)获取Context作对比')
                .fontSize(13)
                .fontColor('#666666')
                .width('100%')

              Text('5. 在控制台查看打印的目录信息')
                .fontSize(13)
                .fontColor('#666666')
                .width('100%')
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#E3F2FD')
            .borderRadius(6)
            .border({ width: 1.5, color: '#90CAF9' })
          }
          .width('95%')
          .alignItems(HorizontalAlign.Start)

          // 获取按钮
          Button('获取缓存目录')
            .id('UiComponentSpecialComponentsUiContextAbility02')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor('#FFFFFF')
            .width('95%')
            .labelStyle({
              overflow: TextOverflow.Clip,
              maxLines: 1,
              minFontSize: 20,
              maxFontSize: 20,
              font: {
                size: 20,
                weight: FontWeight.Bolder,
                family: 'cursive',
                style: FontStyle.Italic
              }
            })
            .height(45)
            .backgroundColor('#007DFF')
            .borderRadius(8)
            .shadow({ radius: 10, color: '#007DFF50', offsetX: 0, offsetY: 4 })
            .scale({ x: this.buttonScale, y: this.buttonScale })
            .animation({
              duration: 200,
              curve: Curve.EaseInOut
            })
            .onClick(() => {
              console.info('================== UIContext测试开始 ==================');
              this.buttonScale = 0.96;
              setTimeout(() => {
                this.buttonScale = 1;
              }, 200);
              try {
                console.info('【方法1】通过UIContext.getHostContext()获取Context：');
                let newContext = this.uiContext?.getHostContext() as common.UIAbilityContext;
                if (newContext) {
                  console.info('✅ newContext获取成功');
                  console.info(`  - cacheDir（缓存目录）: ${newContext.cacheDir}`);

                  this.cacheDir = newContext.cacheDir;
                  this.getStatus = '✓ 获取成功';
                  this.statusColor = Color.Green;
                } else {
                  console.error('❌ newContext获取失败');
                  this.getStatus = '✗ 获取失败';
                  this.statusColor = Color.Red;
                }

                console.info('\n【方法2】通过getContext(this)获取Context（对比）：');
                let context = getContext(this) as common.UIAbilityContext;

                if (context) {
                  console.info('✅ context获取成功');
                  console.info(`  - cacheDir（缓存目录）: ${context.cacheDir}`);
                } else {
                  console.error('❌ context获取失败');
                }

                console.info('\n【对比结果】：');
                if (newContext && context) {
                  if (newContext.cacheDir === context.cacheDir) {
                    console.info('✅ 两种方法获取的cacheDir一致');
                    console.info(`   缓存目录: ${newContext.cacheDir}`);
                  } else {
                    console.warn('⚠️ 两种方法获取的cacheDir不一致');
                    console.warn(`   newContext.cacheDir: ${newContext.cacheDir}`);
                    console.warn(`   context.cacheDir: ${context.cacheDir}`);
                  }
                }
              } catch (error) {
                console.error('❌ 获取Context失败：' + JSON.stringify(error));
                this.getStatus = '✗ 获取异常';
                this.statusColor = Color.Red;
                this.cacheDir = '获取失败';
              }
              console.info('================== UIContext测试结束 ==================\n');
            })

          // 预期结果
          Column({ space: 8 }) {
            Text('✦ 预期结果')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Column({ space: 5 }) {
              Text('• UIContext.getHostContext()成功获取Context')
                .fontSize(13)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• 页面正确显示缓存目录（cacheDir）')
                .fontSize(13)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• 控制台正确打印缓存目录的日志')
                .fontSize(13)
                .fontColor('#4CAF50')
                .width('100%')

              Text('• 两种方法获取的cacheDir一致')
                .fontSize(13)
                .fontColor('#4CAF50')
                .width('100%')
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#E8F5E9')
            .borderRadius(6)
            .border({ width: 1.5, color: '#A5D6A7' })
          }
          .width('95%')
          .alignItems(HorizontalAlign.Start)

        }
        .width('100%')
        .padding(
          {
            left: 10,
            right: 10,
            bottom: 15
          })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

