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
import { http } from '@kit.NetworkKit';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
export struct Navigation39 {
  stack: NavPathStack = new NavPathStack();
  @State mode:NavigationMode = NavigationMode.Stack;
  @State titleMode:NavigationTitleMode = NavigationTitleMode.Free;

  build() {
    Column(){
      Navigation(this.stack) {
        Stack({ alignContent: Alignment.Center }) {
          Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
            .id('nav39PushPage15')
            .width('80%')
            .height(40)
            .margin(20)
            .onClick(() => {
              this.stack.pushPath({ name: 'page15' });
            })
        }
      }
      .width('100%')
      .height('60%')
      .navDestination(page15Builder)
      .title('Main Page')
      .titleMode(NavigationTitleMode.Mini)

      Button('ChangeMode')
        .margin({top:30})
        .height(40)
        .id('nav39ChangeMode')
        .onClick(()=>{
          this.mode = NavigationMode.Auto;
        })

      Button('ChangeTitleMode')
        .margin({top:30})
        .height(40)
        .id('nav39ChangeTitleMode')
        .onClick(()=>{
          this.titleMode = NavigationTitleMode.Full;
        })
    }
    .width('100%')
    .height('100%')
  }
}

@Builder
export function page15Builder(name: string, param: Object) {
  Page15Component();
}

@Builder
export function page16Builder(name: string, param: Object) {
  Page16Component();
}

declare type voidFunc = () => void;

function createPixelMapImage(img: PixelMap | undefined, url: string) {
  let OutData: http.HttpResponse;
  let code: http.ResponseCode | number;
  http.createHttp().request(url,
    (error: BusinessError, data: http.HttpResponse) => {
      if (error) {
        console.error(`http request failed with. Code: ${error.code}, message: ${error.message}`);
      } else {
        OutData = data;
        code = OutData.responseCode;
        if (http.ResponseCode.OK === code) {
          let imageData: ArrayBuffer = OutData.result as ArrayBuffer;
          let imageSource: image.ImageSource = image.createImageSource(imageData);

          class Tmp {
            public height: number = 100;
            public width: number = 100;
          }

          // 创建图片大小
          let options: Record<string, number | boolean | Tmp> = {
            'alphaType': 0, // 透明度
            'editable': false, // 是否可编辑
            'pixelFormat': 3, // 像素格式
            'scaleMode': 1, // 缩略值
            'size': { height: 100, width: 100 }
          }

          imageSource.createPixelMap(options).then((pixelMap: PixelMap) => {
            img = pixelMap;
          })
        }
      }
    }
  );
}

@Component
export struct Page15Component {
  @State name: string = 'page15';
  @State destWidth: string = '100%';
  stack: NavPathStack = new NavPathStack();
  @State backImg: PixelMap | undefined = undefined;
  @State y: string = '0';

  aboutToAppear(): void {
    createPixelMapImage(this.backImg,('https://' + 'i.imgs.ovh' + '/2025/06/26/RtRhM.png'))
  }

  build() {
    NavDestination() {
      Column() {
        Button('push next page', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.stack.pushPath({ name: 'Page16' });
          })

        Button('ChangeImgPng')
          .margin({top:30})
          .height(25)
          .id('nav39ChangeImgPng')
          .onClick(()=>{
            createPixelMapImage(this.backImg,('https://' + 'i.imgs.ovh' + '/2025/06/26/RtRhM.png'))
          })

        Button('ChangeImgJpg')
          .margin({top:30})
          .height(25)
          .id('nav39ChangeImgJpg')
          .onClick(()=>{
            createPixelMapImage(this.backImg,('http://' + 'images.openharmony.cn' + '/活动/开发者大会20250428/大会顶端banner图.jpg'))
          })

        Button('ChangeImgGif')
          .margin({top:30})
          .height(25)
          .id('nav39ChangeImgGif')
          .onClick(()=>{
            createPixelMapImage(this.backImg,('https://' + 'www.runoob.com' + '/try/demo_source/smiley-2.gif'))
          })

        Button('ChangeImgSvg')
          .margin({top:30})
          .height(25)
          .id('nav39ChangeImgSvg')
          .onClick(()=>{
            createPixelMapImage(this.backImg,('https://' + 'images.openharmony.cn' + '/活动/技术大会20240923/补充头像/默认男头像.svg'))
          })

        Button('ChangeImgBmp')
          .margin({top:30})
          .height(25)
          .id('nav39ChangeImgBmp')
          .onClick(()=>{
            createPixelMapImage(this.backImg,'')
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
    .backgroundColor(this.name == 'Page15' ? '#F1F3F5' : '#ff11dee5')
  }
}

@Component
export struct Page16Component {
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
    .title('page16')
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
