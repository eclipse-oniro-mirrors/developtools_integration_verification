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
import { router } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { i18n } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UiArkuiProgressMirror05 {
  @State operationLog: string[] = [];
  @State currentLanguage: string = '';
  @State progressValue: number = 3; // 初始3颗星（共5颗星）
  private readonly MAX_STARS: number = 5;

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '=== UiArkuiProgressMirror05 页面加载 ===');
    this.addLog('UiArkuiProgressMirror05 页面已加载');
    this.addLog('准备测试 Progress 自定义形式镜像功能');
    
    // 获取当前应用偏好语言
    try {
      this.currentLanguage = i18n.System.getAppPreferredLanguage();
      this.addLog(`当前应用语言: ${this.currentLanguage}`);
      hilog.info(0x0000, 'sally', `Current app language: ${this.currentLanguage}`);
    } catch (error) {
      const err = error as BusinessError;
      this.addLog(`获取语言失败: ${err.message}`);
    }
  }

  addLog(message: string) {
    const timestamp = new Date().toLocaleTimeString();
    const log = `[${timestamp}] ${message}`;
    this.operationLog.unshift(log);
    if (this.operationLog.length > 20) {
      this.operationLog.pop();
    }
    hilog.info(0x0000, 'sally', log);
  }

  // 自定义星星进度组件
  @Builder
  StarProgress() {
    Row({ space: 8 }) {
      ForEach([0, 1, 2, 3, 4], (index: number) => {
        Text(index < this.progressValue ? '⭐' : '☆')
          .fontSize(40)
          .fontColor(index < this.progressValue ? '#FFD700' : '#CCCCCC')
      }, (index: number) => `star_${index}`)
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column({ space: 4 }) {
      // 标题区域
      Column({ space: 2 }) {
        Text('Progress自定义形式镜像测试')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .width('100%')
          .textAlign(TextAlign.Center)

        Text('SUB_ACE_UI_ARKUI_PROGRESS_MIRROR_0070')
          .fontSize(8)
          .fontColor('#FFD700')
          .fontFamily('Courier')
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(6)
      .backgroundColor('#FF6F00')

      Scroll() {
        Column({ space: 4 }) {
          // 测试入口项
          Column({ space: 3 }) {
            Text('🚀 测试入口')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Button('ArkUIHDS_Progress_0700')
              .id('ArkUIHDS_Progress_0700')
              .fontSize(14)
              .width('100%')
              .height(40)
              .backgroundColor('#FF6F00')
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Bold)
              .onClick(() => {
                this.addLog('✓ 点击 ArkUIHDS_Progress_0700 项');
                this.addLog('✓ 进入 Progress 组件页面');
                hilog.info(0x0000, 'sally', 'Enter Progress custom form test page');
              })
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 当前进度值显示
          Column({ space: 3 }) {
            Text(`当前星星数: ${this.progressValue} / ${this.MAX_STARS}`)
              .fontSize(16)
              .fontColor('#FF6F00')
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .textAlign(TextAlign.Center)
          }
          .width('96%')
          .padding(5)
          .backgroundColor('#FFF3E0')
          .borderRadius(4)

          // 自定义星星Progress展示区域
          Column({ space: 3 }) {
            Text('⭐ 自定义星星进度')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            this.StarProgress()

            Text(`进度: ${Math.round(this.progressValue / this.MAX_STARS * 100)}%`)
              .fontSize(14)
              .fontColor('#FF6F00')
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .textAlign(TextAlign.Center)
              .margin({ top: 5 })
          }
          .width('96%')
          .padding(15)
          .backgroundColor('#FFF3E0')
          .borderRadius(6)
          .border({ width: 2, color: '#FF6F00' })

          // Progress 控制按钮区域
          Column({ space: 4 }) {
            Text('🎮 Progress 控制')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Row({ space: 8 }) {
              Button('Progress ++')
                .id('UiArkuiProgressMirror05_03')
                .fontSize(14)
                .width('48%')
                .height(38)
                .backgroundColor('#4CAF50')
                .fontColor('#FFFFFF')
                .fontWeight(FontWeight.Bold)
                .onClick(() => {
                  if (this.progressValue < this.MAX_STARS) {
                    this.progressValue++;
                    this.addLog('✓ 点击(Progress++)按钮');
                    this.addLog(`✓ 星星增加至: ${this.progressValue}`);
                    if (this.currentLanguage === 'zh-Hans') {
                      this.addLog('  → 增加方向：左向右');
                    } else if (this.currentLanguage === 'ar') {
                      this.addLog('  → 增加方向：右向左');
                    }
                    hilog.info(0x0000, 'sally', `Star progress increased: ${this.progressValue}`);
                  } else {
                    this.addLog('⚠️ 已达到最大星星数');
                  }
                })

              Button('Progress --')
                .id('UiArkuiProgressMirror05_04')
                .fontSize(14)
                .width('48%')
                .height(38)
                .backgroundColor('#F44336')
                .fontColor('#FFFFFF')
                .fontWeight(FontWeight.Bold)
                .onClick(() => {
                  if (this.progressValue > 0) {
                    this.progressValue--;
                    this.addLog('✓ 点击(Progress--)按钮');
                    this.addLog(`✓ 星星减少至: ${this.progressValue}`);
                    if (this.currentLanguage === 'zh-Hans') {
                      this.addLog('  → 减少方向：右向左');
                    } else if (this.currentLanguage === 'ar') {
                      this.addLog('  → 减少方向：左向右');
                    }
                    hilog.info(0x0000, 'sally', `Star progress decreased: ${this.progressValue}`);
                  } else {
                    this.addLog('⚠️ 已达到最小星星数');
                  }
                })
            }
            .width('100%')
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 语言切换区域
          Column({ space: 4 }) {
            Text('🌐 语言切换')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Text(`当前语言: ${this.currentLanguage || '跟随系统'}`)
              .fontSize(11)
              .fontColor('#666666')
              .width('100%')
              .textAlign(TextAlign.Center)
              .padding(5)
              .backgroundColor('#F5F5F5')
              .borderRadius(4)

            Row({ space: 8 }) {
              Button('汉语')
                .id('UiArkuiProgressMirror05_01')
                .fontSize(14)
                .width('48%')
                .height(38)
                .backgroundColor('#2196F3')
                .fontColor('#FFFFFF')
                .fontWeight(FontWeight.Bold)
                .onClick(() => {
                  try {
                    i18n.System.setAppPreferredLanguage('zh-Hans'); // 设置应用偏好语言为简体中文
                    this.currentLanguage = i18n.System.getAppPreferredLanguage();
                    this.addLog('✓ 点击（汉语）按钮');
                    this.addLog('✓ 语言变为汉语');
                    this.addLog('⚠️ 重启应用后生效');
                    hilog.info(0x0000, 'sally', 'App language set to zh-Hans (Chinese)');
                  } catch (error) {
                    const err = error as BusinessError;
                    this.addLog(`✗ 切换失败: ${err.message}`);
                    hilog.error(0x0000, 'sally', `setAppPreferredLanguage error: ${err.message}`);
                  }
                })

              Button('阿拉伯语')
                .id('UiArkuiProgressMirror05_02')
                .fontSize(14)
                .width('48%')
                .height(38)
                .backgroundColor('#9C27B0')
                .fontColor('#FFFFFF')
                .fontWeight(FontWeight.Bold)
                .onClick(() => {
                  try {
                    i18n.System.setAppPreferredLanguage('ar'); // 设置应用偏好语言为阿拉伯语
                    this.currentLanguage = i18n.System.getAppPreferredLanguage();
                    this.addLog('✓ 点击（阿拉伯语）按钮');
                    this.addLog('✓ 语言变为阿拉伯语');
                    this.addLog('✓ 组件元素左右互换');
                    this.addLog('⚠️ 重启应用后生效');
                    hilog.info(0x0000, 'sally', 'App language set to ar (Arabic)');
                    hilog.info(0x0000, 'sally', 'Components mirrored left-right');
                  } catch (error) {
                    const err = error as BusinessError;
                    this.addLog(`✗ 切换失败: ${err.message}`);
                    hilog.error(0x0000, 'sally', `setAppPreferredLanguage error: ${err.message}`);
                  }
                })
            }
            .width('100%')
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 操作日志
          Column({ space: 3 }) {
            Text('📋 事件日志')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Scroll() {
              Column({ space: 1 }) {
                if (this.operationLog.length > 0) {
                  ForEach(this.operationLog, (log: string, index: number) => {
                    Text(log)
                      .fontSize(8)
                      .fontColor(log.includes('✓') ? '#4CAF50' :
                        log.includes('✗') ? '#F44336' : 
                        log.includes('⚠️') ? '#FF9800' : '#666666')
                      .fontFamily('Courier')
                      .width('100%')
                      .padding(3)
                      .backgroundColor(index % 2 === 0 ? '#F5F5F5' : '#FFFFFF')
                  }, (log: string, index: number) => `${index}_${log}`)
                } else {
                  Text('暂无事件日志')
                    .fontSize(8)
                    .fontColor('#999999')
                    .width('100%')
                    .textAlign(TextAlign.Center)
                    .padding(4)
                }
              }
              .width('100%')
            }
            .width('100%')
            .height('9.84%')
            .backgroundColor('#FAFAFA')
            .borderRadius(4)
            .border({ width: 1, color: '#E0E0E0' })
            .scrollBar(BarState.Auto)
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 测试说明
          Column({ space: 2 }) {
            Text('📝 测试说明与预期结果')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Column({ space: 1 }) {
              Text('🎯 测试步骤：')
                .fontSize(9)
                .fontColor('#FF6F00')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('1️⃣ 启动应用 2️⃣ 点击(ArkUIHDS_Progress_0700)项')
                .fontSize(8)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 6 })

              Text('3️⃣ 点击（汉语）按钮 4️⃣ 点击(Progress++) 5️⃣ 点击(Progress--)')
                .fontSize(8)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 6 })

              Text('6️⃣ 点击（阿拉伯语）按钮 7️⃣ 点击(Progress++) 8️⃣ 点击(Progress--)')
                .fontSize(8)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 6 })

              Divider()
                .margin({ top: 2, bottom: 2 })

              Text('✅ 预期结果（汉语）：')
                .fontSize(9)
                .fontColor('#2196F3')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('3-1、语言变为汉语')
                .fontSize(8)
                .fontColor('#2196F3')
                .width('100%')
                .margin({ left: 6 })

              Text('4-1、星星增加 4-2、增加方向：左→右')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
                .margin({ left: 6 })

              Text('5-1、星星减少 5-2、减少方向：右→左')
                .fontSize(8)
                .fontColor('#F44336')
                .width('100%')
                .margin({ left: 6 })

              Divider()
                .margin({ top: 2, bottom: 2 })

              Text('✅ 预期结果（阿拉伯语）：')
                .fontSize(9)
                .fontColor('#9C27B0')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('6-1、语言变为阿拉伯语 6-2、组件元素左右互换')
                .fontSize(8)
                .fontColor('#9C27B0')
                .width('100%')
                .margin({ left: 6 })

              Text('7-1、星星增加 7-2、增加方向：右→左')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
                .margin({ left: 6 })

              Text('8-1、星星减少 8-2、减少方向：左→右')
                .fontSize(8)
                .fontColor('#F44336')
                .width('100%')
                .margin({ left: 6 })

              Divider()
                .margin({ top: 2, bottom: 2 })

              Text('💡 说明：自定义Progress使用星星显示，镜像时星星排列方向会自动反转')
                .fontSize(8)
                .fontColor('#FF9800')
                .width('100%')
                .margin({ left: 6 })
            }
            .width('100%')
            .padding(5)
            .backgroundColor('#FFF3E0')
            .borderRadius(4)
            .alignItems(HorizontalAlign.Start)
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

        }
        .width('100%')
        .padding({ left: 4, right: 4, bottom: 4 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}

