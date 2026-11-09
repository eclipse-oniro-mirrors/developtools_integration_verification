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

interface ParamInfo0330 {
  info: string;
}

// PageHome1 组件
@Component
export struct PageHome10330 {
  build() {
    NavDestination() {
      Column() {
        Text('PageHome1 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('这是栈底页面')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#4CAF50')
        
        Text('(setKeepBottomPage后clear会保留此页面)')
          .fontSize(12)
          .margin({ top: 5 })
          .fontColor('#999999')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#E3F2FD')
    }
    .title('PageHome1')
    .hideTitleBar(false)
  }
}

// PageDetail1 组件
@Component
export struct PageDetail10330 {
  build() {
    NavDestination() {
      Column() {
        Text('PageDetail1 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('这是 PageDetail1 的内容')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFEBEE')
    }
    .title('PageDetail1')
    .hideTitleBar(false)
  }
}

// PageFull1 组件
@Component
export struct PageFull10330 {
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
export struct MultiNavigation0330 {
  @State resultText: string = '结果显示区域';
  @State keepBottomPageSet: boolean = false;
  private navPathStack: NavPathStack = new NavPathStack();

  aboutToAppear() {
    // 初始化时添加PageHome1作为栈底页面
    try {
      let param: ParamInfo0330 = { info: 'ok' };
      let params: Array<string | ParamInfo0330> = ['paramTest', param];
      this.navPathStack.pushPathByName('PageHome1', params);
      console.info('[MultiNavigation0330] 初始化: 已添加PageHome1作为栈底');
    } catch (error) {
      console.error('[MultiNavigation0330] 初始化错误:', error);
    }
  }

  @Builder
  PageMap(name: string) {
    if (name === 'PageHome1') {
      PageHome10330()
    } else if (name === 'PageDetail1') {
      PageDetail10330()
    } else if (name === 'PageFull1') {
      PageFull10330()
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

          // 结果显示区域
          Column() {
            Text('结果显示')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 5 })
              .alignSelf(ItemAlign.Start)

            Text(this.resultText)
              .id('resultText')
              .fontSize(12)
              .fontColor('#333333')
              .width('100%')
              .padding(8)
              .backgroundColor('#F5F5F5')
              .borderRadius(6)
              .height(60)
          }
          .width('95%')
          .padding(10)
          .backgroundColor('#FFFFFF')
          .borderRadius(8)

          // 操作按钮区域
          Column({ space: 6 }) {
            Button('pushPathByName PageDetail1')
              .id('pushPageDetail1Button')
              .fontSize(13)
              .backgroundColor('#2196F3')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  let param: ParamInfo0330 = { info: 'ok' };
                  this.navPathStack.pushPathByName('PageDetail1', param);
                  this.resultText = '已添加 PageDetail1';
                  console.info('[MultiNavigation0330] pushPathByName PageDetail1');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0330] Error:', error);
                }
              })

            Button('pushPathByName PageFull1')
              .id('pushPageFull1Button')
              .fontSize(13)
              .backgroundColor('#2196F3')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  let param: ParamInfo0330 = { info: 'ok' };
                  this.navPathStack.pushPathByName('PageFull1', param);
                  this.resultText = '已添加 PageFull1';
                  console.info('[MultiNavigation0330] pushPathByName PageFull1');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0330] Error:', error);
                }
              })

            Button('pushPathByName PageHome1')
              .id('pushPageHome1Button')
              .fontSize(13)
              .backgroundColor('#2196F3')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  let param: ParamInfo0330 = { info: 'ok' };
                  let params: Array<string | ParamInfo0330> = ['paramTest', param];
                  this.navPathStack.pushPathByName('PageHome1', params);
                  this.resultText = '已添加 PageHome1';
                  console.info('[MultiNavigation0330] pushPathByName PageHome1');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0330] Error:', error);
                }
              })

            Divider().strokeWidth(1).color('#E0E0E0').margin({ top: 5, bottom: 5 })

            Button('getAllPathName')
              .id('getAllPathNameButton')
              .fontSize(13)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  const allPathNames = this.navPathStack.getAllPathName();
                  this.resultText = `界面显示：${allPathNames.join('，')}`;
                  console.info('[MultiNavigation0330] getAllPathName:', allPathNames);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0330] Error:', error);
                }
              })

            Button('setKeepBottomPage true')
              .id('setKeepBottomPageButton')
              .fontSize(13)
              .backgroundColor(this.keepBottomPageSet ? '#4CAF50' : '#FF9800')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  // 使用类型断言调用 setKeepBottomPage
                  (this.navPathStack as ESObject).setKeepBottomPage(true);
                  this.keepBottomPageSet = true;
                  this.resultText = '已设置 setKeepBottomPage true';
                  console.info('[MultiNavigation0330] setKeepBottomPage true');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0330] Error:', error);
                }
              })

            Button('clear')
              .id('clearButton')
              .fontSize(13)
              .backgroundColor('#9C27B0')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  this.navPathStack.clear();
                  this.resultText = `已执行 clear${this.keepBottomPageSet ? ' - 保留栈底PageHome1页面' : ''}`;
                  console.info('[MultiNavigation0330] clear executed, keepBottomPage:', this.keepBottomPageSet);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0330] Error:', error);
                }
              })

            Divider().strokeWidth(1).color('#E0E0E0').margin({ top: 5, bottom: 5 })

            Button('size')
              .id('sizeButton')
              .fontSize(13)
              .backgroundColor('#607d7B')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  const stackSize = this.navPathStack.size();
                  this.resultText = `栈大小：${stackSize}`;
                  console.info('[MultiNavigation0330] size:', stackSize);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0330] Error:', error);
                }
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
                  // 重新添加初始PageHome1
                  let param: ParamInfo0330 = { info: 'ok' };
                  let params: Array<string | ParamInfo0330> = ['paramTest', param];
                  this.navPathStack.pushPathByName('PageHome1', params);
                  this.keepBottomPageSet = false;
                  this.resultText = '结果显示区域';
                  console.info('[MultiNavigation0330] 测试已重置');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0330] Error:', error);
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
        Column() {
          Text('MultiNavigation 主页面')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })
          
          Text('初始栈底: PageHome1')
            .fontSize(14)
            .margin({ top: 10 })
            .fontColor('#666666')
          
          Text('测试setKeepBottomPage保留栈底')
            .fontSize(12)
            .margin({ top: 5 })
            .fontColor('#999999')
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#FFF9C4')
      }
      .navDestination(this.PageMap)
      .mode(NavigationMode.Stack)
      .height('28.69%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
