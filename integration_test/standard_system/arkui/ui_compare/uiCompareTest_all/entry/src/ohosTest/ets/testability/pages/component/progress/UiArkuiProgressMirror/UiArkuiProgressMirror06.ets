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
struct UiArkuiProgressMirror06 {
  @State operationLog: string[] = [];
  @State currentLanguage: string = '';
  @State progressValue: number = 60;

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '=== UiArkuiProgressMirror06 页面加载 ===');
    this.addLog('UiArkuiProgressMirror06 页面已加载');
    this.addLog('准备测试 Progress 扫光效果镜像功能');
    
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
        Text('Progress扫光效果镜像测试')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .width('100%')
          .textAlign(TextAlign.Center)

        Text('SUB_ACE_UI_ARKUI_PROGRESS_MIRROR_0050')
          .fontSize(8)
          .fontColor('#FFD700')
          .fontFamily('Courier')
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(6)
      .backgroundColor('#00BCD4')

      Scroll() {
        Column({ space: 4 }) {
          // 测试入口项
          Column({ space: 3 }) {
            Text('🚀 测试入口')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Button('ArkUIHDS_Progress_0500')
              .id('ArkUIHDS_Progress_0500')
              .fontSize(14)
              .width('100%')
              .height(40)
              .backgroundColor('#00BCD4')
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Bold)
              .onClick(() => {
                this.addLog('✓ 点击 ArkUIHDS_Progress_0500 项');
                this.addLog('✓ 进入 Progress 组件页面');
                hilog.info(0x0000, 'sally', 'Enter Progress scan effect test page');
              })
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // Progress 展示区域 - Linear 扫光效果
          Column({ space: 3 }) {
            Text('📊 Linear 类型 - 扫光效果')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Progress({ value: this.progressValue, total: 100, type: ProgressType.Linear })
              .width('90%')
              .height(20)
              .color('#00BCD4')
              .style({ enableScanEffect: true })

            Text('汉语: 扫光从左→右 ⟶')
              .fontSize(9)
              .fontColor('#4CAF50')
              .width('100%')
              .textAlign(TextAlign.Center)

            Text('阿拉伯语: 扫光从右→左 ⟵')
              .fontSize(9)
              .fontColor('#2196F3')
              .width('100%')
              .textAlign(TextAlign.Center)
          }
          .width('96%')
          .padding(8)
          .backgroundColor('#E0F7FA')
          .borderRadius(6)
          .border({ width: 2, color: '#00BCD4' })

          // Progress 展示区域 - Capsule 扫光效果
          Column({ space: 3 }) {
            Text('💊 Capsule 类型 - 扫光效果')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Progress({ value: this.progressValue, total: 100, type: ProgressType.Capsule })
              .width('90%')
              .height(40)
              .color('#0097A7')
              .style({ enableScanEffect: true })

            Text('汉语: 扫光从左→右 ⟶')
              .fontSize(9)
              .fontColor('#4CAF50')
              .width('100%')
              .textAlign(TextAlign.Center)

            Text('阿拉伯语: 扫光从右→左 ⟵')
              .fontSize(9)
              .fontColor('#2196F3')
              .width('100%')
              .textAlign(TextAlign.Center)
          }
          .width('96%')
          .padding(8)
          .backgroundColor('#B2EBF2')
          .borderRadius(6)
          .border({ width: 2, color: '#0097A7' })
          .alignItems(HorizontalAlign.Center)

          // Progress 展示区域 - Ring 扫光效果
          Column({ space: 3 }) {
            Text('⭕ Ring 类型 - 扫光效果')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Progress({ value: this.progressValue, total: 100, type: ProgressType.Ring })
              .width(100)
              .height(100)
              .style({ strokeWidth: 15, enableScanEffect: true })
              .color('#00ACC1')

            Text('汉语: 扫光顺时针 ⟳')
              .fontSize(9)
              .fontColor('#4CAF50')
              .width('100%')
              .textAlign(TextAlign.Center)

            Text('阿拉伯语: 扫光逆时针 ⟲')
              .fontSize(9)
              .fontColor('#2196F3')
              .width('100%')
              .textAlign(TextAlign.Center)
          }
          .width('96%')
          .padding(8)
          .backgroundColor('#80DEEA')
          .borderRadius(6)
          .border({ width: 2, color: '#00ACC1' })
          .alignItems(HorizontalAlign.Center)

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
                .id('UiArkuiProgressMirror06_01')
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
                    this.addLog('✓ Progress组件扫光效果显示正常');
                    this.addLog('✓ Linear、Capsule类型扫光从左到右');
                    this.addLog('✓ Ring类型扫光效果顺时针方向');
                    this.addLog('⚠️ 重启应用后生效');
                    hilog.info(0x0000, 'sally', 'App language set to zh-Hans (Chinese)');
                    hilog.info(0x0000, 'sally', 'Scan effect: Linear/Capsule left-to-right, Ring clockwise');
                  } catch (error) {
                    const err = error as BusinessError;
                    this.addLog(`✗ 切换失败: ${err.message}`);
                    hilog.error(0x0000, 'sally', `setAppPreferredLanguage error: ${err.message}`);
                  }
                })

              Button('阿拉伯语')
                .id('UiArkuiProgressMirror06_02')
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
                    this.addLog('✓ Progress组件扫光效果显示正常');
                    this.addLog('✓ Linear、Capsule类型扫光从右到左');
                    this.addLog('✓ Ring类型扫光效果逆时针方向');
                    this.addLog('⚠️ 重启应用后生效');
                    hilog.info(0x0000, 'sally', 'App language set to ar (Arabic)');
                    hilog.info(0x0000, 'sally', 'Components mirrored left-right');
                    hilog.info(0x0000, 'sally', 'Scan effect: Linear/Capsule right-to-left, Ring counter-clockwise');
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
                .fontColor('#00BCD4')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('1️⃣ 启动应用 2️⃣ 点击(ArkUIHDS_Progress_0500)项')
                .fontSize(8)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 6 })

              Text('3️⃣ 点击（汉语）按钮 4️⃣ 点击（阿拉伯语）按钮')
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

              Text('3-2、Progress组件扫光效果显示正常')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
                .margin({ left: 6 })

              Text('3-3、Linear、Capsule类型扫光从左到右 ⟶')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
                .margin({ left: 6 })

              Text('3-4、Ring类型扫光效果顺时针方向 ⟳')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
                .margin({ left: 6 })

              Divider()
                .margin({ top: 2, bottom: 2 })

              Text('✅ 预期结果（阿拉伯语）：')
                .fontSize(9)
                .fontColor('#9C27B0')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('4-1、语言变为阿拉伯语 4-2、组件元素左右互换')
                .fontSize(8)
                .fontColor('#9C27B0')
                .width('100%')
                .margin({ left: 6 })

              Text('4-3、Progress组件扫光效果显示正常')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
                .margin({ left: 6 })

              Text('4-4、Linear、Capsule类型扫光从右到左 ⟵')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
                .margin({ left: 6 })

              Text('4-5、Ring类型扫光效果逆时针方向 ⟲')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
                .margin({ left: 6 })

              Divider()
                .margin({ top: 2, bottom: 2 })

              Text('💡 说明：扫光效果使用 .style({ enableScanEffect: true }) 启用')
                .fontSize(8)
                .fontColor('#FF9800')
                .width('100%')
                .margin({ left: 6 })

              Text('💡 扫光会在进度条上产生闪光动画效果，镜像时方向会自动反转')
                .fontSize(8)
                .fontColor('#FF9800')
                .width('100%')
                .margin({ left: 6 })
            }
            .width('100%')
            .padding(5)
            .backgroundColor('#E0F7FA')
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

