# android-libs
<br>
各个库都已经配置好了编译器，直接拷贝到虚拟机上运行（我的虚拟机是Ubuntu-16.04 64bit）<br>
我使用的ndk是android-ndk-r10d<br>
<br>

1. json-c编译方法：<br>
	直接拷贝到虚拟机，进入到json-c/jni目录<br>
	运行ndk-build即可编译，输出在json-c目录下的obj目录<br>
	如果ndk-build找不到试着全路径运行ndk-build<br>
<br>
	json-c在嵌入式用的比较多，尤其是openwrt或者lede系统，我是搞嵌入式的，做openwrt/lede开发较多，习惯了json-c<br>
<br>
2. openssl编译方法：<br>
	把仓库中openssl代码拷贝到虚拟机，进入openssl目录，<br>
	修改setenv-android.sh：<br>
		_ANDROID_NDK="android-ndk-r10d" （根据实际版本使用配置）<br>
		_ANDROID_EABI="arm-linux-androideabi-4.9"<br>
<br>
	运行：export ANDROID_NDK_ROOT=“这里填写android-ndk-r10d的路径”<br>
			export ANDROID_NDK_HOME=“这里填写android-ndk-r10d的路径”<br>
		以上两条命令都运行一下，否则setenv-android.sh会提示ANDROID_NDK_HOME未设置<br>
<br>
	运行source ./setenv-android.sh<br>
	运行mkdir build 创建输出目录<br>
	执行./config no-shared --openssldir=./build/$ANDROID_API --prefix=./build/$ANDROID_API<br>
	最后编译:<br>
		make depend<br>
		make<br>
	输出到build<br>
<br>
3.libevent编译<br>
	进入到libevent源码目录<br>
	新建一个文件夹 openssl，把源码openssl编译出来的libssl.a libcrypto.a 以及include下的openssl文件夹拷贝到刚刚新建的openssl目录中，<br>
	拷贝源码openssl目录下的setenv-android.sh到libevent目录中，setenv-android.sh参考openssl编译的方法修改。<br>
	运行：export ANDROID_NDK_ROOT=“这里填写android-ndk-r10d的路径”<br>
		export ANDROID_NDK_HOME=“这里填写android-ndk-r10d的路径”<br>
	以上两条命令都运行一下，否则setenv-android.sh会提示ANDROID_NDK_HOME未设置<br>
	运行source ./setenv-android.sh<br>
	运行SYSROOT=/home/caixiwen/android-ndk-r10d/platforms/android-18/arch-arm （根据自己的目录修改）<br>
	运行./configure --host=arm-linux-androideabi CC=arm-linux-androideabi-gcc CFLAGS=--sysroot=$SYSROOT<br>
	修改makefile，找到OPENSSL_INCS 和 OPENSSL_LIBS，设置openssl的头文件和库（就是刚刚建立的openssl文件夹）<br>
	因为openssl编译出来的是静态库，OPENSSL_LIBS = openssl/libssl.a openssl/libcrypto.a<br>
	编译 make<br>
	输出 .libs目录下<br>
<br>



