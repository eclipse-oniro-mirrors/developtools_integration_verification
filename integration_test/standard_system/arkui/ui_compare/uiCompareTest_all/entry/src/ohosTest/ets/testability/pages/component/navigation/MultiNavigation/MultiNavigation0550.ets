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

interface ParamInfo0550 {
  info: string;
}

// PageHome1 组件 - 左侧主页
@Component
export struct PageHome10550 {
  build() {
    Column() {
      Text('PageHome1 页面')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
      
      Text('左侧主页')
        .fontSize(16)
        .margin({ top: 10 })
        .fontColor('#666666')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#E3F2FD')
  }
}

// PageDetail1 组件
@Component
export struct PageDetail10550 {
  private navPathStack: NavPathStack = new NavPathStack();
  @State resultText: string = '';

  build() {
    NavDestination() {
      Column() {
        Text('PageDetail1 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('右侧详情页')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
        
        Text('页面显示正常')
          .fontSize(14)
          .margin({ top: 20 })
          .fontColor('#4CAF50')
          .fontWeight(FontWeight.Bold)

        // 右侧分栏操作按钮
        Column({ space: 8 }) {
          Button('replacePath PageDetail1')
            .id('replacePageDetail1ButtonRight')
            .fontSize(13)
            .backgroundColor('#FF9800')
            .fontColor('#FFFFFF')
            .width('90%')
            .height(36)
            .margin({ top: 20 })
            .onClick(() => {
              try {
                let param: ParamInfo0550 = { info: 'ok' };
                (this.navPathStack as ESObject).replacePathByName('PageDetail1', param);
                this.resultText = '已从右侧执行 replacePath PageDetail1';
                console.info('[MultiNavigation0550] replacePath PageDetail1 from right');
              } catch (error) {
                this.resultText = `错误: ${error}`;
                console.error('[MultiNavigation0550] Error:', error);
              }
            })

          if (this.resultText) {
            Text(this.resultText)
              .fontSize(12)
              .fontColor('#666666')
              .margin({ top: 10 })
          }
        }
        .width('100%')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFEBEE')
    }
    .title('PageDetail1')
    .hideTitleBar(false)
    .onReady((context: NavDestinationContext) => {
      this.navPathStack = context.pathStack;
    })
  }
}

@Entry
@Component
export struct MultiNavigation0550 {
  @State resultText: string = '结果显示区域';
  private navPathStack: NavPathStack = new NavPathStack();

  aboutToAppear() {
    // 初始化时添加PageHome1作为左侧主页
    try {
      let param: ParamInfo0550 = { info: 'ok' };
      let params: Array<string | ParamInfo0550> = ['paramTest', param];
      this.navPathStack.pushPathByName('PageHome1', params);
      console.info('[MultiNavigation0550] 初始化: 已添加PageHome1');
    } catch (error) {
      console.error('[MultiNavigation0550] 初始化错误:', error);
    }
  }

  @Builder
  PageMap(name: string) {
    if (name === 'PageHome1') {
      PageHome10550()
    } else if (name === 'PageDetail1') {
      PageDetail10550()
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

      // 控制按钮区域(左侧分栏)
      Column({ space: 6 }) {
        // 结果显示区域
        Text(this.resultText)
          .id('resultText')
          .fontSize(11)
          .fontColor('#333333')
          .width('95%')
          .padding(6)
          .backgroundColor('#F5F5F5')
          .borderRadius(6)
          .height(50)
          .margin({ top: 10 })

        Button('pushPath PageDetail1')
          .id('pushPageDetail1Button')
          .fontSize(12)
          .backgroundColor('#2196F3')
          .fontColor('#FFFFFF')
          .width('95%')
          .height(32)
          .onClick(() => {
            try {
              let param: ParamInfo0550 = { info: 'ok' };
              this.navPathStack.pushPathByName('PageDetail1', param);
              this.resultText = '已跳转到 PageDetail1 - 页面双栏显示';
              console.info('[MultiNavigation0550] pushPath PageDetail1');
            } catch (error) {
              this.resultText = `错误: ${error}`;
              console.error('[MultiNavigation0550] Error:', error);
            }
          })

        Button('getAllPathName')
          .id('getAllPathNameButton')
          .fontSize(12)
          .backgroundColor('#4CAF50')
          .fontColor('#FFFFFF')
          .width('95%')
          .height(32)
          .onClick(() => {
            try {
              const allPathNames = this.navPathStack.getAllPathName();
              this.resultText = `界面显示: getAllPathName return : ${allPathNames.join('，')}`;
              console.info('[MultiNavigation0550] getAllPathName:', allPathNames);
            } catch (error) {
              this.resultText = `错误: ${error}`;
              console.error('[MultiNavigation0550] Error:', error);
            }
          })

        Divider().strokeWidth(1).color('#E0E0E0').margin({ top: 3, bottom: 3 })

        Button('pop')
          .id('popButton')
          .fontSize(12)
          .backgroundColor('#9C27B0')
          .fontColor('#FFFFFF')
          .width('95%')
          .height(32)
          .onClick(() => {
            try {
              this.navPathStack.pop();
              const size = this.navPathStack.size();
              this.resultText = `已执行 pop (栈大小:${size})`;
              console.info('[MultiNavigation0550] pop, size:', size);
            } catch (error) {
              this.resultText = `错误: ${error}`;
              console.error('[MultiNavigation0550] Error:', error);
            }
          })

        Button('size')
          .id('sizeButton')
          .fontSize(12)
          .backgroundColor('#607d7B')
          .fontColor('#FFFFFF')
          .width('95%')
          .height(32)
          .onClick(() => {
            try {
              const stackSize = this.navPathStack.size();
              this.resultText = `栈大小：${stackSize}`;
              console.info('[MultiNavigation0550] size:', stackSize);
            } catch (error) {
              this.resultText = `错误: ${error}`;
              console.error('[MultiNavigation0550] Error:', error);
            }
          })

        Button('重置测试')
          .fontSize(12)
          .backgroundColor('#F44336')
          .fontColor('#FFFFFF')
          .width('95%')
          .height(32)
          .onClick(() => {
            try {
              this.navPathStack.clear();
              // 重新添加初始PageHome1
              let param: ParamInfo0550 = { info: 'ok' };
              let params: Array<string | ParamInfo0550> = ['paramTest', param];
              this.navPathStack.pushPathByName('PageHome1', params);
              this.resultText = '结果显示区域';
              console.info('[MultiNavigation0550] 测试已重置');
            } catch (error) {
              this.resultText = `错误: ${error}`;
              console.error('[MultiNavigation0550] Error:', error);
            }
          })
      }
      .width('100%')
      .padding({ top: 5, bottom: 10 })

      // Navigation 组件区域 - Split模式实现双栏
      Navigation(this.navPathStack) {
        // 左侧主页内容
        PageHome10550()
      }
      .navDestination(this.PageMap)
      .mode(NavigationMode.Split)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
