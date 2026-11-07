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
struct UiArkuiProgressMirror08 {
  @State operationLog: string[] = [];
  @State currentLanguage: string = '';
  @State progressValue: number = 65;

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '=== UiArkuiProgressMirror08 页面加载 ===');
    this.addLog('UiArkuiProgressMirror08 页面已加载');
    this.addLog('准备测试 Progress 阴影效果功能');
    
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
    Column({ space: 3 }) {
      // 标题区域
      Column({ space: 2 }) {
        Text('Progress阴影效果测试')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .width('100%')
          .textAlign(TextAlign.Center)

        Text('SUB_ACE_UI_ARKUI_PROGRESS_MIRROR_0090')
          .fontSize(8)
          .fontColor('#FFD700')
          .fontFamily('Courier')
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(5)
      .backgroundColor('#7B1FA2')

      Scroll() {
        Column({ space: 3 }) {
          // 测试入口项
          Column({ space: 2 }) {
            Text('🚀 测试入口')
              .fontSize(9)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Button('ArkUIHDS_Progress_0900')
              .id('ArkUIHDS_Progress_0900')
              .fontSize(13)
              .width('100%')
              .height(35)
              .backgroundColor('#7B1FA2')
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Bold)
              .onClick(() => {
                this.addLog('✓ 点击 ArkUIHDS_Progress_0900 项');
                this.addLog('✓ 进入 Progress 组件页面');
                hilog.info(0x0000, 'sally', 'Enter Progress shadow effect test page');
              })
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 当前进度值显示
          Column({ space: 2 }) {
            Text(`当前进度值: ${this.progressValue}`)
              .fontSize(14)
              .fontColor('#7B1FA2')
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .textAlign(TextAlign.Center)
          }
          .width('96%')
          .padding(4)
          .backgroundColor('#F3E5F5')
          .borderRadius(4)

          // Ring 类型 - 带阴影效果
          Column({ space: 3 }) {
            Text('⭕ Ring 类型 - 带阴影效果')
              .fontSize(9)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Progress({ value: this.progressValue, total: 100, type: ProgressType.Ring })
              .width(120)
              .height(120)
              .style({ strokeWidth: 15, shadow: true })
              .color('#7B1FA2')

            Text('当前进度区域周围有阴影效果')
              .fontSize(10)
              .fontColor('#4CAF50')
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .textAlign(TextAlign.Center)

            Text('阴影增强了进度条的立体感')
              .fontSize(9)
              .fontColor('#666666')
              .width('100%')
              .textAlign(TextAlign.Center)
          }
          .width('96%')
          .padding(10)
          .backgroundColor('#F3E5F5')
          .borderRadius(6)
          .border({ width: 2, color: '#7B1FA2' })
          .alignItems(HorizontalAlign.Center)

          // Ring 类型 - 无阴影效果（对比）
          Column({ space: 3 }) {
            Text('⭕ Ring 类型 - 无阴影效果（对比）')
              .fontSize(9)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Progress({ value: this.progressValue, total: 100, type: ProgressType.Ring })
              .width(120)
              .height(120)
              .style({ strokeWidth: 15, shadow: false })
              .color('#9C27B0')

            Text('无阴影效果，显示平面化')
              .fontSize(10)
              .fontColor('#F44336')
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .textAlign(TextAlign.Center)

            Text('对比上方可明显看出阴影的作用')
              .fontSize(9)
              .fontColor('#666666')
              .width('100%')
              .textAlign(TextAlign.Center)
          }
          .width('96%')
          .padding(10)
          .backgroundColor('#E1BEE7')
          .borderRadius(6)
          .border({ width: 2, color: '#9C27B0' })
          .alignItems(HorizontalAlign.Center)

          // 语言切换区域
          Column({ space: 3 }) {
            Text('🌐 语言切换')
              .fontSize(9)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Text(`当前语言: ${this.currentLanguage || '跟随系统'}`)
              .fontSize(10)
              .fontColor('#666666')
              .width('100%')
              .textAlign(TextAlign.Center)
              .padding(4)
              .backgroundColor('#F5F5F5')
              .borderRadius(4)

            Row({ space: 6 }) {
              Button('汉语')
                .id('UiArkuiProgressMirror08_01')
                .fontSize(13)
                .width('48%')
                .height(35)
                .backgroundColor('#2196F3')
                .fontColor('#FFFFFF')
                .fontWeight(FontWeight.Bold)
                .onClick(() => {
                  try {
                    i18n.System.setAppPreferredLanguage('zh-Hans');
                    this.currentLanguage = i18n.System.getAppPreferredLanguage();
                    this.addLog('✓ 点击（汉语）按钮');
                    this.addLog('✓ 语言变为汉语');
                    this.addLog('✓ 组件显示符合汉语语言习惯 ltr');
                    this.addLog('✓ 当前进度区域周围有阴影效果');
                    this.addLog('⚠️ 重启应用后生效');
                    hilog.info(0x0000, 'sally', 'App language set to zh-Hans (Chinese)');
                    hilog.info(0x0000, 'sally', 'Progress shadow effect visible in LTR layout');
                  } catch (error) {
                    const err = error as BusinessError;
                    this.addLog(`✗ 切换失败: ${err.message}`);
                    hilog.error(0x0000, 'sally', `setAppPreferredLanguage error: ${err.message}`);
                  }
                })

              Button('阿拉伯语')
                .id('UiArkuiProgressMirror08_02')
                .fontSize(13)
                .width('48%')
                .height(35)
                .backgroundColor('#9C27B0')
                .fontColor('#FFFFFF')
                .fontWeight(FontWeight.Bold)
                .onClick(() => {
                  try {
                    i18n.System.setAppPreferredLanguage('ar');
                    this.currentLanguage = i18n.System.getAppPreferredLanguage();
                    this.addLog('✓ 点击（阿拉伯语）按钮');
                    this.addLog('✓ 语言变为阿拉伯语');
                    this.addLog('✓ 组件元素左右互换');
                    this.addLog('✓ 当前进度区域周围有阴影效果');
                    this.addLog('⚠️ 重启应用后生效');
                    hilog.info(0x0000, 'sally', 'App language set to ar (Arabic)');
                    hilog.info(0x0000, 'sally', 'Components mirrored left-right');
                    hilog.info(0x0000, 'sally', 'Progress shadow effect visible in RTL layout');
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
          Column({ space: 2 }) {
            Text('📋 事件日志')
              .fontSize(9)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Scroll() {
              Column({ space: 1 }) {
                if (this.operationLog.length > 0) {
                  ForEach(this.operationLog, (log: string, index: number) => {
                    Text(log)
                      .fontSize(7)
                      .fontColor(log.includes('✓') ? '#4CAF50' :
                        log.includes('✗') ? '#F44336' : 
                        log.includes('⚠️') ? '#FF9800' : '#666666')
                      .fontFamily('Courier')
                      .width('100%')
                      .padding(2)
                      .backgroundColor(index % 2 === 0 ? '#F5F5F5' : '#FFFFFF')
                  }, (log: string, index: number) => `${index}_${log}`)
                } else {
                  Text('暂无事件日志')
                    .fontSize(7)
                    .fontColor('#999999')
                    .width('100%')
                    .textAlign(TextAlign.Center)
                    .padding(3)
                }
              }
              .width('100%')
            }
            .width('100%')
            .height('8.2%')
            .backgroundColor('#FAFAFA')
            .borderRadius(4)
            .border({ width: 1, color: '#E0E0E0' })
            .scrollBar(BarState.Auto)
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 测试说明
          Column({ space: 2 }) {
            Text('📝 测试说明')
              .fontSize(9)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Column({ space: 1 }) {
              Text('步骤: 1️⃣启动应用 2️⃣点击(ArkUIHDS_Progress_0900)项')
                .fontSize(7)
                .fontColor('#666666')
                .width('100%')

              Text('3️⃣点击（汉语）按钮 4️⃣点击（阿拉伯语）按钮')
                .fontSize(7)
                .fontColor('#666666')
                .width('100%')

              Divider()
                .margin({ top: 1, bottom: 1 })

              Text('✅ 预期结果（汉语）：')
                .fontSize(8)
                .fontColor('#2196F3')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('3-1、语言变为汉语')
                .fontSize(7)
                .fontColor('#2196F3')
                .width('100%')

              Text('3-2、组件显示符合汉语语言习惯 ltr（从左到右）')
                .fontSize(7)
                .fontColor('#4CAF50')
                .width('100%')

              Text('3-3、当前进度区域周围有阴影效果')
                .fontSize(7)
                .fontColor('#4CAF50')
                .width('100%')

              Divider()
                .margin({ top: 1, bottom: 1 })

              Text('✅ 预期结果（阿拉伯语）：')
                .fontSize(8)
                .fontColor('#9C27B0')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('4-1、语言变为阿拉伯语')
                .fontSize(7)
                .fontColor('#9C27B0')
                .width('100%')

              Text('4-2、组件元素左右互换（RTL镜像）')
                .fontSize(7)
                .fontColor('#9C27B0')
                .width('100%')

              Text('4-3、当前进度区域周围有阴影效果')
                .fontSize(7)
                .fontColor('#4CAF50')
                .width('100%')

              Divider()
                .margin({ top: 1, bottom: 1 })

              Text('💡 说明: shadow:true 开启阴影/false 关闭阴影')
                .fontSize(7)
                .fontColor('#FF9800')
                .width('100%')

              Text('💡 阴影效果增强进度条立体感，在镜像时同样生效')
                .fontSize(7)
                .fontColor('#FF9800')
                .width('100%')
            }
            .width('100%')
            .padding(4)
            .backgroundColor('#F3E5F5')
            .borderRadius(4)
            .alignItems(HorizontalAlign.Start)
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

        }
        .width('100%')
        .padding({ left: 3, right: 3, bottom: 3 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}

