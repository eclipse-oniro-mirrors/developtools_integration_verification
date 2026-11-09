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
struct UiArkuiProgressMirror04 {
  @State operationLog: string[] = [];
  @State currentLanguage: string = '';
  @State progressValue: number = 50;

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '=== UiArkuiProgressMirror04 页面加载 ===');
    this.addLog('UiArkuiProgressMirror04 页面已加载');
    this.addLog('准备测试 Progress 组件 Value 值变化功能');
    
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

  build() {
    Column({ space: 4 }) {
      // 标题区域
      Column({ space: 2 }) {
        Text('Progress Value值变化镜像测试')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .width('100%')
          .textAlign(TextAlign.Center)

        Text('SUB_ACE_UI_ARKUI_PROGRESS_MIRROR_0010')
          .fontSize(8)
          .fontColor('#FFD700')
          .fontFamily('Courier')
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(6)
      .backgroundColor('#E64A19')

      Scroll() {
        Column({ space: 4 }) {
          // 测试入口项
          Column({ space: 3 }) {
            Text('🚀 测试入口')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Button('ArkUIHDS_Progress_0100')
              .id('ArkUIHDS_Progress_0100')
              .fontSize(14)
              .width('100%')
              .height(40)
              .backgroundColor('#E64A19')
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Bold)
              .onClick(() => {
                this.addLog('✓ 点击 ArkUIHDS_Progress_0100 项');
                this.addLog('✓ 进入 Progress 组件页面');
                hilog.info(0x0000, 'sally', 'Enter Progress Value change test page');
              })
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 当前进度值显示
          Column({ space: 3 }) {
            Text(`当前进度值: ${this.progressValue}`)
              .fontSize(16)
              .fontColor('#E64A19')
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .textAlign(TextAlign.Center)
          }
          .width('96%')
          .padding(5)
          .backgroundColor('#FFEBEE')
          .borderRadius(4)

          // Progress 展示区域 - Linear
          Column({ space: 3 }) {
            Text('📊 Linear 类型')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Progress({ value: this.progressValue, total: 100, type: ProgressType.Linear })
              .width('100%')
              .height(16)
              .color('#E64A19')
          }
          .width('96%')
          .padding(6)
          .backgroundColor('#FFEBEE')
          .borderRadius(6)
          .border({ width: 1, color: '#E64A19' })

          // Progress 展示区域 - Eclipse (deprecated but for compatibility)
          Column({ space: 3 }) {
            Text('⭕ Eclipse 类型')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Progress({ value: this.progressValue, total: 100, type: ProgressType.Eclipse })
              .width(80)
              .height(80)
              .color('#FF5722')
          }
          .width('96%')
          .padding(6)
          .backgroundColor('#FBE9E7')
          .borderRadius(6)
          .border({ width: 1, color: '#FF5722' })
          .alignItems(HorizontalAlign.Center)

          // Progress 展示区域 - Capsule
          Column({ space: 3 }) {
            Text('💊 Capsule 类型')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Progress({ value: this.progressValue, total: 100, type: ProgressType.Capsule })
              .width('80%')
              .height(35)
              .color('#FF9800')
          }
          .width('96%')
          .padding(6)
          .backgroundColor('#FFF3E0')
          .borderRadius(6)
          .border({ width: 1, color: '#FF9800' })
          .alignItems(HorizontalAlign.Center)

          // Progress 展示区域 - ScaleRing
          Column({ space: 3 }) {
            Text('🎯 ScaleRing 类型')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Progress({ value: this.progressValue, total: 100, type: ProgressType.ScaleRing })
              .width(80)
              .height(80)
              .color('#FFC107')
          }
          .width('96%')
          .padding(6)
          .backgroundColor('#FFFDE7')
          .borderRadius(6)
          .border({ width: 1, color: '#FFC107' })
          .alignItems(HorizontalAlign.Center)

          // Progress 展示区域 - Ring
          Column({ space: 3 }) {
            Text('⭕ Ring 类型')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Progress({ value: this.progressValue, total: 100, type: ProgressType.Ring })
              .width(80)
              .height(80)
              .style({ strokeWidth: 12 })
              .color('#CDDC39')
          }
          .width('96%')
          .padding(6)
          .backgroundColor('#F9FBE7')
          .borderRadius(6)
          .border({ width: 1, color: '#CDDC39' })
          .alignItems(HorizontalAlign.Center)

          // Value 控制按钮区域
          Column({ space: 4 }) {
            Text('🎮 Value 控制')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Row({ space: 8 }) {
              Button('Value + 10')
                .id('UiArkuiProgressMirror04_03')
                .fontSize(14)
                .width('48%')
                .height(38)
                .backgroundColor('#4CAF50')
                .fontColor('#FFFFFF')
                .fontWeight(FontWeight.Bold)
                .onClick(() => {
                  this.progressValue = Math.min(this.progressValue + 10, 100);
                  this.addLog('✓ 点击(Value + 10)按钮');
                  this.addLog(`✓ 进度条增长至: ${this.progressValue}`);
                  if (this.currentLanguage === 'zh-Hans') {
                    this.addLog('  → linear、eclipse、capsule: 从左向右增长');
                    this.addLog('  → scaleRing、Ring: 顺时针增长');
                  } else if (this.currentLanguage === 'ar') {
                    this.addLog('  → linear、eclipse、capsule: 从右向左增长');
                    this.addLog('  → scaleRing、Ring: 逆时针增长');
                  }
                  hilog.info(0x0000, 'sally', `Progress value increased: ${this.progressValue}`);
                })

              Button('Value - 10')
                .id('UiArkuiProgressMirror04_04')
                .fontSize(14)
                .width('48%')
                .height(38)
                .backgroundColor('#F44336')
                .fontColor('#FFFFFF')
                .fontWeight(FontWeight.Bold)
                .onClick(() => {
                  this.progressValue = Math.max(this.progressValue - 10, 0);
                  this.addLog('✓ 点击(Value - 10)按钮');
                  this.addLog(`✓ 进度条减少至: ${this.progressValue}`);
                  if (this.currentLanguage === 'zh-Hans') {
                    this.addLog('  → linear、eclipse、capsule: 从右向左减少');
                    this.addLog('  → scaleRing、Ring: 逆时针减少');
                  } else if (this.currentLanguage === 'ar') {
                    this.addLog('  → linear、eclipse、capsule: 从左向右减少');
                    this.addLog('  → scaleRing、Ring: 顺时针减少');
                  }
                  hilog.info(0x0000, 'sally', `Progress value decreased: ${this.progressValue}`);
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
                .id('UiArkuiProgressMirror04_01')
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
                .id('UiArkuiProgressMirror04_02')
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
                        log.includes('✗') ? '#F44336' : '#666666')
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
                .fontColor('#E64A19')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('1️⃣ 启动应用 2️⃣ 点击(ArkUIHDS_Progress_0100)项')
                .fontSize(8)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 6 })

              Text('3️⃣ 点击（汉语）按钮 4️⃣ 点击(Value+10) 5️⃣ 点击(Value-10)')
                .fontSize(8)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 6 })

              Text('6️⃣ 点击（阿拉伯语）按钮 7️⃣ 点击(Value+10) 8️⃣ 点击(Value-10)')
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

              Text('4-1、进度条增长 4-2、linear/eclipse/capsule:从左→右 4-3、Ring:顺时针⟳')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
                .margin({ left: 6 })

              Text('5-1、进度条减少 5-2、linear/eclipse/capsule:从右→左 5-3、Ring:逆时针⟲')
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

              Text('7-1、进度条增长 7-2、linear/eclipse/capsule:从右→左 7-3、Ring:逆时针⟲')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
                .margin({ left: 6 })

              Text('8-1、进度条减少 8-2、linear/eclipse/capsule:从左→右 8-3、Ring:顺时针⟳')
                .fontSize(8)
                .fontColor('#F44336')
                .width('100%')
                .margin({ left: 6 })

              Divider()
                .margin({ top: 2, bottom: 2 })
            }
            .width('100%')
            .padding(5)
            .backgroundColor('#FFEBEE')
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

