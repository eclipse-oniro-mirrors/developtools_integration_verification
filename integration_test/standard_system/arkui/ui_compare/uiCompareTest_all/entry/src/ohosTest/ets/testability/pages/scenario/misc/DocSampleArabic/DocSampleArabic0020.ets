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

import { i18n } from '@kit.LocalizationKit';

@Entry
@Component
struct DocSampleArabic0020 {
  @State displayText: string = 'قفز إلى';
  @State originalArabicText: string = 'قفز إلى';
  @State chineseText: string = '跳转到';
  @State currentLanguage: string = '未设置';
  @State layoutDirection: string = 'LTR (从左到右)';
  @State textDirection: string = '自动检测';
  @State textLanguage: string = '阿拉伯语';
  @State stepStatus: string = '步骤1: 已输入阿拉伯语文本';
  @State step2Done: boolean = false;
  @State step3Done: boolean = false;

  aboutToAppear(): void {
    console.info('[阿拉伯语测试] 页面初始化');
    // 获取当前应用偏好语言
    try {
      let preferredLanguage = i18n.System.getAppPreferredLanguage();
      this.currentLanguage = preferredLanguage || '系统默认';
      console.info(`[阿拉伯语测试] 当前应用偏好语言: ${this.currentLanguage}`);
    } catch (err) {
      console.error(`[阿拉伯语测试] 获取语言失败: ${err.message}`);
    }
  }

  // 切换到阿拉伯语
  switchToArabic(): void {
    console.info('[阿拉伯语测试] 步骤2: 切换语言为阿拉伯语');
    try {
      i18n.System.setAppPreferredLanguage('ar');
      this.displayText = this.originalArabicText;
      this.currentLanguage = 'ar (阿拉伯语)';
      this.layoutDirection = 'RTL (从右到左)';
      this.textDirection = 'RTL (从右到左)';
      this.textLanguage = '阿拉伯语';
      this.stepStatus = '步骤2: 已切换到阿拉伯语';
      this.step2Done = true;
      console.info('[阿拉伯语测试] 切换到阿拉伯语成功');
      console.info('[阿拉伯语测试] 预期结果: 页面布局从右向左，文本按从右向左显示');
    } catch (err) {
      console.error(`[阿拉伯语测试] 切换到阿拉伯语失败: ${err.message}`);
      this.stepStatus = `步骤2失败: ${err.message}`;
    }
  }

  // 切换到中文
  switchToChinese(): void {
    console.info('[阿拉伯语测试] 步骤3: 切换语言为中文');
    try {
      i18n.System.setAppPreferredLanguage('zh-CN');
      this.displayText = this.chineseText;
      this.currentLanguage = 'zh-CN (中文)';
      this.layoutDirection = 'LTR (从左向右)';
      this.textDirection = 'LTR (从左向右)';
      this.textLanguage = '中文';
      this.stepStatus = '步骤3: 已切换到中文';
      this.step3Done = true;
      console.info('[阿拉伯语测试] 切换到中文成功');
      console.info('[阿拉伯语测试] 预期结果: 页面布局从左向右，文本显示为中文');
    } catch (err) {
      console.error(`[阿拉伯语测试] 切换到中文失败: ${err.message}`);
      this.stepStatus = `步骤3失败: ${err.message}`;
    }
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('阿拉伯语国际化测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
      }
      .width('100%')
      .height('4.59%')
      .backgroundColor('#2196F3')
      .justifyContent(FlexAlign.Center)

      Scroll() {
        Column() {
          // 当前状态显示
          Column() {
            Text('当前状态')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Row() {
              Text('当前语言: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(this.currentLanguage)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor('#2196F3')
            }
            .width('100%')
            .justifyContent(FlexAlign.Start)
            .margin({ bottom: 5 })

            Row() {
              Text('页面布局方向: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(this.layoutDirection)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(this.step2Done ? '#4CAF50' : '#FF9800')
            }
            .width('100%')
            .justifyContent(FlexAlign.Start)
            .margin({ bottom: 5 })

            Row() {
              Text('文本显示方向: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(this.textDirection)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(this.step2Done ? '#4CAF50' : '#FF9800')
            }
            .width('100%')
            .justifyContent(FlexAlign.Start)
            .margin({ bottom: 5 })

            Row() {
              Text('文本语言: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(this.textLanguage)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(this.step3Done ? '#4CAF50' : '#2196F3')
            }
            .width('100%')
            .justifyContent(FlexAlign.Start)
            .margin({ bottom: 5 })

            Divider()
              .margin({ top: 10, bottom: 10 })

            Text(this.stepStatus)
              .fontSize(14)
              .fontColor(this.step3Done ? '#4CAF50' : (this.step2Done ? '#2196F3' : '#FF9800'))
              .fontWeight(FontWeight.Medium)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#F5F5F5')
          .borderRadius(10)
          .margin({ top: 20 })

          // 文本显示区域
          Column() {
            Text('文本显示区域')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            // 大号显示文本
            Text(this.displayText)
              .fontSize(32)
              .fontWeight(FontWeight.Bold)
              .fontColor('#333333')
              .width('100%')
              .textAlign(TextAlign.Center)
              .padding(20)
              .backgroundColor('#FFFFFF')
              .borderRadius(8)
              .border({ width: 2, color: this.step3Done ? '#4CAF50' : '#2196F3' })
              .margin({ bottom: 10 })

            Text(`当前显示文本: ${this.displayText} (${this.textLanguage})`)
              .fontSize(12)
              .fontColor('#999999')
              .margin({ bottom: 5 })

            Text(this.step3Done ? '说明: 已切换为中文显示' : '说明: 文本会根据语言设置自动切换')
              .fontSize(12)
              .fontColor('#999999')
          }
          .width('90%')
          .padding(15)
          .backgroundColor(this.step3Done ? '#E8F5E9' : '#E3F2FD')
          .borderRadius(10)
          .margin({ top: 20 })

          // 测试步骤说明
          Column() {
            Text('测试步骤')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            // 步骤1
            Row() {
              Text('✓')
                .fontSize(18)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Bold)
                .margin({ right: 10 })
                .width(24)

              Column() {
                Text('步骤1: 输入阿拉伯语文本')
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
                  .fontColor('#4CAF50')
                  .alignSelf(ItemAlign.Start)
                  .margin({ bottom: 5 })

                Text('已输入文本: قفز إلى')
                  .fontSize(12)
                  .fontColor('#666666')
                  .alignSelf(ItemAlign.Start)
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .alignItems(VerticalAlign.Top)
            .margin({ bottom: 15 })

            // 步骤2
            Row() {
              Text(this.step2Done ? '✓' : '→')
                .fontSize(18)
                .fontColor(this.step2Done ? '#4CAF50' : '#2196F3')
                .fontWeight(FontWeight.Bold)
                .margin({ right: 10 })
                .width(24)

              Column() {
                Text('步骤2: 切换语言为阿拉伯语')
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(this.step2Done ? '#4CAF50' : '#333333')
                  .alignSelf(ItemAlign.Start)
                  .margin({ bottom: 5 })

                Text('预期: 页面布局从右向左，文本按从右向左显示')
                  .fontSize(12)
                  .fontColor('#666666')
                  .alignSelf(ItemAlign.Start)
                  .margin({ bottom: 8 })

                Button('切换到阿拉伯语')
                  .id('button_switch_to_arabic')
                  .fontSize(14)
                  .backgroundColor(this.step2Done ? '#4CAF50' : '#2196F3')
                  .fontColor('#FFFFFF')
                  .height(36)
                  .enabled(!this.step2Done)
                  .onClick(() => {
                    this.switchToArabic();
                  })
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .alignItems(VerticalAlign.Top)
            .margin({ bottom: 15 })

            // 步骤3
            Row() {
              Text(this.step3Done ? '✓' : (this.step2Done ? '→' : '○'))
                .fontSize(18)
                .fontColor(this.step3Done ? '#4CAF50' : (this.step2Done ? '#2196F3' : '#CCCCCC'))
                .fontWeight(FontWeight.Bold)
                .margin({ right: 10 })
                .width(24)

              Column() {
                Text('步骤3: 切换语言为中文')
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(this.step3Done ? '#4CAF50' : (this.step2Done ? '#333333' : '#999999'))
                  .alignSelf(ItemAlign.Start)
                  .margin({ bottom: 5 })

                Text('预期: 页面布局从左向右，文本切换为中文显示')
                  .fontSize(12)
                  .fontColor('#666666')
                  .alignSelf(ItemAlign.Start)
                  .margin({ bottom: 8 })

                Button('切换到中文')
                  .id('button_switch_to_chinese')
                  .fontSize(14)
                  .backgroundColor(this.step3Done ? '#4CAF50' : '#2196F3')
                  .fontColor('#FFFFFF')
                  .height(36)
                  .enabled(this.step2Done && !this.step3Done)
                  .onClick(() => {
                    this.switchToChinese();
                  })
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .alignItems(VerticalAlign.Top)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(10)
          .margin({ top: 20 })
          .border({ width: 1, color: '#E0E0E0' })

          // 预期结果说明
          Column() {
            Text('预期结果验证')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            Column() {
              Text('步骤2预期结果:')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 8 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('页面布局从右向左 (RTL)')
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
                Text('阿拉伯语文本按从右向左显示')
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
                Text('界面元素对齐方式改变')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
            }
            .width('100%')
            .padding(10)
            .backgroundColor(this.step2Done ? '#E8F5E9' : '#FFF3E0')
            .borderRadius(8)
            .margin({ bottom: 15 })

            Column() {
              Text('步骤3预期结果:')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 8 })

              Row() {
                Text('•')
                  .fontSize(14)
                  .margin({ right: 8 })
                Text('页面布局从左向右 (LTR)')
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
                Text('文本内容切换为中文显示')
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
                Text('界面元素恢复为从左向右对齐')
                  .fontSize(13)
                  .fontColor('#666666')
                  .layoutWeight(1)
              }
              .width('100%')
            }
            .width('100%')
            .padding(10)
            .backgroundColor(this.step3Done ? '#E8F5E9' : '#FFF3E0')
            .borderRadius(8)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#F5F5F5')
          .borderRadius(10)
          .margin({ top: 20, bottom: 30 })

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
