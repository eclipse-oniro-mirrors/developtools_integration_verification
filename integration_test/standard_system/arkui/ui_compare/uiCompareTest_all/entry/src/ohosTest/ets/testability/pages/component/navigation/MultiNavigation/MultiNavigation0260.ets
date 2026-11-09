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


interface ParamInfo0260 {
  info: string;
}

// PageHome1 组件
@Component
export struct PageHome10260 {
  build() {
    NavDestination() {
      Column() {
        Text('PageHome1 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('主页面')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
        
        Text('页面显示正常')
          .fontSize(14)
          .margin({ top: 20 })
          .fontColor('#4CAF50')
          .fontWeight(FontWeight.Bold)
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
export struct PageDetail10260 {
  build() {
    NavDestination() {
      Column() {
        Text('PageDetail1 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('详情页面1')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
        
        Text('页面显示正常')
          .fontSize(14)
          .margin({ top: 20 })
          .fontColor('#4CAF50')
          .fontWeight(FontWeight.Bold)
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

// PageDetail2 组件
@Component
export struct PageDetail20260 {
  build() {
    NavDestination() {
      Column() {
        Text('PageDetail2 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('详情页面2')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
        
        Text('页面显示正常')
          .fontSize(14)
          .margin({ top: 20 })
          .fontColor('#4CAF50')
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#E0F7FA')
    }
    .title('PageDetail2')
    .hideTitleBar(false)
  }
}

// PageFull1 组件
@Component
export struct PageFull10260 {
  build() {
    NavDestination() {
      Column() {
        Text('PageFull1 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('全屏页面')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
        
        Text('页面显示正常')
          .fontSize(14)
          .margin({ top: 20 })
          .fontColor('#4CAF50')
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#F0F4C3')
    }
    .title('PageFull1')
    .hideTitleBar(false)
  }
}

@Entry
@Component
export struct MultiNavigation0260 {
  @State resultText: string = '结果显示区域';
  private navPathStack: NavPathStack = new NavPathStack();

  aboutToAppear() {
    // 初始化时添加PageHome1
    try {
      let param: ParamInfo0260 = { info: 'ok' };
      let params: Array<string | ParamInfo0260> = ['paramTest', param];
      this.navPathStack.pushPathByName('PageHome1', params);
      console.info('[MultiNavigation0260] 初始化: 已添加PageHome1');
    } catch (error) {
      console.error('[MultiNavigation0260] 初始化错误:', error);
    }
  }

  @Builder
  PageMap(name: string) {
    if (name === 'PageHome1') {
      PageHome10260()
    } else if (name === 'PageDetail1') {
      PageDetail10260()
    } else if (name === 'PageDetail2') {
      PageDetail20260()
    } else if (name === 'PageFull1') {
      PageFull10260()
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
                  let param: ParamInfo0260 = { info: 'ok' };
                  this.navPathStack.pushPathByName('PageDetail1', param);
                  this.resultText = '已添加 PageDetail1';
                  console.info('[MultiNavigation0260] pushPathByName PageDetail1');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0260] Error:', error);
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
                  let param: ParamInfo0260 = { info: 'ok' };
                  this.navPathStack.pushPathByName('PageFull1', param);
                  this.resultText = '已添加 PageFull1';
                  console.info('[MultiNavigation0260] pushPathByName PageFull1');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0260] Error:', error);
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
                  let param: ParamInfo0260 = { info: 'ok' };
                  let params: Array<string | ParamInfo0260> = ['paramTest', param];
                  this.navPathStack.pushPathByName('PageHome1', params);
                  this.resultText = '已添加 PageHome1';
                  console.info('[MultiNavigation0260] pushPathByName PageHome1');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0260] Error:', error);
                }
              })

            Button('pushPathByName PageDetail2')
              .id('pushPageDetail2Button')
              .fontSize(13)
              .backgroundColor('#2196F3')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  let param: ParamInfo0260 = { info: 'ok' };
                  this.navPathStack.pushPathByName('PageDetail2', param);
                  this.resultText = '已添加 PageDetail2';
                  console.info('[MultiNavigation0260] pushPathByName PageDetail2');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0260] Error:', error);
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
                  console.info('[MultiNavigation0260] getAllPathName:', allPathNames);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0260] Error:', error);
                }
              })

            Button('size')
              .id('sizeButton')
              .fontSize(13)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  const stackSize = this.navPathStack.size();
                  const allPathNames = this.navPathStack.getAllPathName();
                  this.resultText = `界面显示：${stackSize}`;
                  console.info('[MultiNavigation0260] size:', stackSize);
                  console.info('[MultiNavigation0260] 当前栈内容:', allPathNames);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0260] Error:', error);
                }
              })

            Divider().strokeWidth(1).color('#E0E0E0').margin({ top: 5, bottom: 5 })

            Button('getParamByName PageHome1')
              .id('getParamPageHome1Button')
              .fontSize(13)
              .backgroundColor('#FF9800')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  const params = this.navPathStack.getParamByName('PageHome1') as Object[];
                  this.resultText = `界面显示：getParamByName return :${JSON.stringify(params)}`;
                  console.info('[MultiNavigation0260] getParamByName PageHome1:', params);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0260] Error:', error);
                }
              })

            Button('getParamByName PageDetail1')
              .id('getParamPageDetail1Button')
              .fontSize(13)
              .backgroundColor('#FF9800')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  const params = this.navPathStack.getParamByName('PageDetail1') as Object[];
                  this.resultText = `界面显示：getParamByName return :${JSON.stringify(params)}`;
                  console.info('[MultiNavigation0260] getParamByName PageDetail1:', params);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0260] Error:', error);
                }
              })

            Button('getParamByName PageFull1')
              .id('getParamPageFull1Button')
              .fontSize(13)
              .backgroundColor('#FF9800')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  const params = this.navPathStack.getParamByName('PageFull1') as Object[];
                  this.resultText = `界面显示：getParamByName return :${JSON.stringify(params)}`;
                  console.info('[MultiNavigation0260] getParamByName PageFull1:', params);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0260] Error:', error);
                }
              })

            Divider().strokeWidth(1).color('#E0E0E0').margin({ top: 5, bottom: 5 })

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
                  let param: ParamInfo0260 = { info: 'ok' };
                  let params: Array<string | ParamInfo0260> = ['paramTest', param];
                  this.navPathStack.pushPathByName('PageHome1', params);
                  this.resultText = '结果显示区域';
                  console.info('[MultiNavigation0260] 测试已重置');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0260] Error:', error);
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
          
          Text('测试 MultiNavigation 栈操作')
            .fontSize(14)
            .margin({ top: 10 })
            .fontColor('#666666')
          
          Text('点击按钮进行测试')
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
