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

@Entry
@Component
export struct Navigation04 {
  stack: NavPathStack = new NavPathStack();
  @State mode:NavigationMode = NavigationMode.Stack;
  @State titleMode:NavigationTitleMode = NavigationTitleMode.Free;

  build() {
    Column(){
      Navigation(this.stack) {
        Stack({ alignContent: Alignment.Center }) {
          Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
            .id('nav04PushPageOne')
            .width('80%')
            .height(40)
            .margin(20)
            .onClick(() => {
              this.stack.pushPath({ name: 'pageOne' });
            })
        }
      }
      .width('100%')
      .height('60%')
      .navDestination(pageOneBuilder)
      .title('Main Page')
      .titleMode(NavigationTitleMode.Mini)

      Button('ChangeMode')
        .margin({top:30})
        .height(40)
        .id('nav04ChangeMode')
        .onClick(()=>{
          this.mode = NavigationMode.Auto;
        })

      Button('ChangeTitleMode')
        .margin({top:30})
        .height(40)
        .id('nav04ChangeTitleMode')
        .onClick(()=>{
          this.titleMode = NavigationTitleMode.Full;
        })
    }
    .width('100%')
    .height('100%')
  }
}

@Builder
export function pageOneBuilder(name: string, param: Object) {
  PageOneComponent();
}

declare type voidFunc = () => void;

@Component
export struct PageOneComponent {
  @State name: string = 'pageOne';
  @State destWidth: string = '100%';
  stack: NavPathStack = new NavPathStack();
  @State backImg: string = 'resources/base/media/icon.png';
  @State y: string = '0';

  build() {
    NavDestination() {
      Column() {
        Button('push next page', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.stack.pushPath({ name: 'PageTwo' });
          })

        Button('ChangeImgPng')
          .margin({top:30})
          .height(25)
          .id('nav04ChangeImgPng')
          .onClick(()=>{
            this.backImg = 'resources/base/media/icon.png';
          })

        Button('ChangeImgJpg')
          .margin({top:30})
          .height(25)
          .id('nav04ChangeImgJpg')
          .onClick(()=>{
            this.backImg = ('https://' + 'images.openharmony.cn' + '/330-%E8%BF%90%E8%90%A5%E5%9B%BE/%E5%AD%A6%E9%99%A2/530/application_basic_l.jpg');
          })

        Button('ChangeImgGif')
          .margin({top:30})
          .height(25)
          .id('nav04ChangeImgGif')
          .onClick(()=>{
            this.backImg = 'resources/base/media/icon3.gif';
          })

        Button('ChangeImgSvg')
          .margin({top:30})
          .height(25)
          .id('nav04ChangeImgSvg')
          .onClick(()=>{
            this.backImg = 'resources/base/media/icon2.svg';
          })

        Button('ChangeImgBmp')
          .margin({top:30})
          .height(25)
          .id('nav04ChangeImgBmp')
          .onClick(()=>{
            this.backImg = ('https://' + 'docimg9.docs.qq.com' + '/image/AgAABd3lbMrG1njr_7dKwYs9RKdNxYEz.png?w=114&h=114');
          })
      }
      .size({ width: '100%', height: '100%' })
    }
    .backButtonIcon(this.backImg)
    .height('100%')
    .title(this.name)
    .translate({ y: this.y })
    .onReady((context) => {
      this.name = context.pathInfo.name;
      this.stack = context.pathStack;
    })
    .backgroundColor(this.name == 'PageOne' ? '#F1F3F5' : '#ff11dee5')
  }
}

@Component
export struct PageTwoComponent {
  private stack: NavPathStack | null = null;
  @State eventStr: string = '';

  build() {
    NavDestination() {
      Column() {
        Text('event: ' + this.eventStr)
        Button('pop', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.stack?.pop();
          })
      }
      .width('100%')
      .height('100%')
    }
    .title('pageTwo')
    .backButtonIcon('resources/base/media/icon.png')
    .onAppear(() => {
      this.eventStr += '<onAppear>';
    })
    .onDisAppear(() => {
      this.eventStr += '<onDisAppear>';
    })
    .onShown(() => {
      this.eventStr += '<onShown>';
    })
    .onHidden(() => {
      this.eventStr += '<onHidden>';
    })
    .onWillAppear(() => {
      this.eventStr += '<onWillAppear>';
    })
    .onWillDisappear(() => {
      this.eventStr += '<onWillDisappear>';
    })
    .onWillShow(() => {
      this.eventStr += '<onWillShow>';
    })
    .onWillHide(() => {
      this.eventStr += '<onWillHide>';
    })
    // onReady会在onAppear之前调用
    .onReady((ctx: NavDestinationContext) => {
      try {
        this.eventStr += '<onReady>';
        this.stack = ctx.pathStack;
      } catch (e) {
        console.log(`testTag onReady catch exception: ${JSON.stringify(e)}`);
      }
    })
  }
}

