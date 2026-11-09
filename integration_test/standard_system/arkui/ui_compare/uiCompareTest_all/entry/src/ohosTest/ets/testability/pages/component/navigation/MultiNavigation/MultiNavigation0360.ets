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

interface ParamInfo0360 {
  info: string;
}

// PageFull1 组件
@Component
export struct PageFull10360 {
  build() {
    NavDestination() {
      Column() {
        Text('PageFull1 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('这是 PageFull1 的内容')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#F3E5F5')
    }
    .title('PageFull1')
    .hideTitleBar(false)
  }
}

@Entry
@Component
export struct MultiNavigation0360 {
  @State resultText: string = '结果显示区域';
  @State lifecycleLog: string[] = [];
  private navPathStack: NavPathStack = new NavPathStack();

  // 添加生命周期日志
  addLifecycleLog(lifecycle: string) {
    const timestamp = new Date().toLocaleTimeString();
    const log = `[${timestamp}] ${lifecycle}`;
    this.lifecycleLog.push(log);
    this.resultText = this.lifecycleLog.join('\n');
    console.info(`[MultiNavigation0360] ${log}`);
  }

  aboutToAppear() {
    this.addLifecycleLog('Home页面: aboutToAppear');
  }

  onPageShow() {
    this.addLifecycleLog('Home页面: onPageShow');
  }

  onPageHide() {
    this.addLifecycleLog('Home页面: onPageHide');
  }

  onBackPress() {
    this.addLifecycleLog('Home页面: onBackPress');
    return false;
  }

  aboutToDisappear() {
    this.addLifecycleLog('Home页面: aboutToDisappear');
  }

  @Builder
  PageMap(name: string) {
    if (name === 'PageFull1') {
      PageFull10360()
    }
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('MultiNavigation测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
      }
      .width('100%')
      .height('4.59%')
      .backgroundColor('#2196F3')
      .justifyContent(FlexAlign.Center)

      Scroll() {
        Column({ space: 8 }) {

          // 生命周期日志显示区域
          Column() {
            Text('生命周期日志')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 5 })
              .alignSelf(ItemAlign.Start)

            Scroll() {
              Text(this.resultText)
                .id('resultText')
                .fontSize(11)
                .fontColor('#333333')
                .width('100%')
                .padding(8)
                .textAlign(TextAlign.Start)
            }
            .width('100%')
            .height('9.84%')
            .backgroundColor('#F5F5F5')
            .borderRadius(6)
            .scrollBar(BarState.Auto)
          }
          .width('95%')
          .padding(10)
          .backgroundColor('#FFFFFF')
          .borderRadius(8)

          // 操作按钮区域
          Column({ space: 6 }) {
            Button('pushPath PageFull1')
              .id('pushPathButton')
              .fontSize(13)
              .backgroundColor('#2196F3')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  this.addLifecycleLog('点击: pushPath PageFull1');
                  let param: ParamInfo0360 = { info: 'ok' };
                  this.navPathStack.pushPathByName('PageFull1', param);
                } catch (error) {
                  this.addLifecycleLog(`错误: ${error}`);
                  console.error('[MultiNavigation0360] Error:', error);
                }
              })

            Divider().strokeWidth(1).color('#E0E0E0').margin({ top: 5, bottom: 5 })

            Button('pop')
              .id('popButton')
              .fontSize(13)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  this.addLifecycleLog('点击: pop');
                  this.navPathStack.pop();
                } catch (error) {
                  this.addLifecycleLog(`错误: ${error}`);
                  console.error('[MultiNavigation0360] Error:', error);
                }
              })

            Button('clear')
              .id('clearButton')
              .fontSize(13)
              .backgroundColor('#FF9800')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  this.addLifecycleLog('点击: clear');
                  this.navPathStack.clear();
                } catch (error) {
                  this.addLifecycleLog(`错误: ${error}`);
                  console.error('[MultiNavigation0360] Error:', error);
                }
              })

            Button('清空日志')
              .fontSize(13)
              .backgroundColor('#9C27B0')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                this.lifecycleLog = [];
                this.resultText = '结果显示区域';
                console.info('[MultiNavigation0360] 日志已清空');
              })

            Button('重置测试')
              .fontSize(13)
              .backgroundColor('#F44336')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  this.navPathStack.clear();
                  this.lifecycleLog = [];
                  this.resultText = '结果显示区域';
                  console.info('[MultiNavigation0360] 测试已重置');
                } catch (error) {
                  this.addLifecycleLog(`错误: ${error}`);
                  console.error('[MultiNavigation0360] Error:', error);
                }
              })
          }
          .width('95%')
          .padding(10)
          .backgroundColor('#FFFFFF')
          .borderRadius(8)
        }
        .width('100%')
        .padding({ top: 10, bottom: 10 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.None)

      // Navigation 组件区域
      Navigation(this.navPathStack) {
        // Home主页面内容
        NavDestination() {
          Column() {
            Text('Home 主页面')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .margin({ top: 20 })
            
            Text('测试生命周期')
              .fontSize(14)
              .margin({ top: 10 })
              .fontColor('#666666')
            
            Text('点击pushPath会触发onWillHide/onHidden')
              .fontSize(12)
              .margin({ top: 5 })
              .fontColor('#999999')
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#FFF9C4')
        }
        .hideTitleBar(true)
        .onWillShow(() => {
          this.addLifecycleLog('Home页面: onWillShow');
        })
        .onShown(() => {
          this.addLifecycleLog('Home页面: onShown');
        })
        .onWillHide(() => {
          this.addLifecycleLog('Home页面: onWillHide ✓');
        })
        .onHidden(() => {
          this.addLifecycleLog('Home页面: onHidden ✓');
        })
      }
      .navDestination(this.PageMap)
      .mode(NavigationMode.Stack)
      .height('24.59%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
