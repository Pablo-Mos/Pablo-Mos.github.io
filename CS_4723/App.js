import React, { useState, useEffect } from 'react';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Image, Text, Modal, View, TouchableOpacity, TextInput, Platform, ScrollView, KeyboardAvoidingView, Share, Alert, Keyboard, TouchableWithoutFeedback} from 'react-native';
import DateTimePicker from '@react-native-community/datetimepicker';
import { Ionicons } from '@expo/vector-icons';
import Svg, { Circle, Text as SvgText } from 'react-native-svg';
import { LineChart } from 'react-native-chart-kit';
import {KeyboardAwareScrollView} from 'react-native-keyboard-aware-scroll-view';
import { db } from './config';
import { ref, onValue } from 'firebase/database';
import * as Notifications from 'expo-notifications';
import logo from './assets/water2.png';

export default function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [email, setEmail] = useState('');
  const [battery, setBattery] = useState(0);
  const [password, setPassword] = useState('');
  const [onboardingComplete, setOnboardingComplete] = useState(false);
  const [medicalConditions, setMedicalConditions] = useState([]);
  const [inputValue, setInputValue] = useState('');
  const [userInfo, setUserInfo] = useState({name: 'Jane Doe', age: '25', gender: 'Female', weight: '130', weeklyWorkouts: '3',});
  // const [userInfo, setUserInfo] = useState({name: '', age: '', gender: '', weight: '', weeklyWorkouts: '',});
  const [showProfile, setShowProfile] = useState(false);
  const [bluetoothColor, setBluetoothColor] = useState('white');
  const [bluetoothColor2, setBluetoothColor2] = useState('#5DCCFC');
  const [BmodalVisible, setBModalVisible] = useState(false);
  const [AmodalVisible, setAModalVisible] = useState(false);
  const [DmodalVisible, setDModalVisible] = useState(false);
  const [ImodalVisible, setIModalVisible] = useState(false);
  const [sModalVisible, setsModalVisible] = useState(false);
  const [selectedDrink, setSelectedDrink] = useState(''); 
  const [totalOzDevice, setTotalOzDevice] = useState(null);
  const [totalOzManual, setTotalOzManual] = useState(38.0);
  const [totalWaterDrank, setTotalWaterDrank] = useState(0);
  const [waterGoal, setWaterGoal] = useState(0);
  const [selectedTime, setSelectedTime] = useState(new Date());
  const [selectedDate, setSelectedDate] = useState(new Date());
  const [selectedAmount, setSelectedAmount] = useState(0);
  const [showPicker, setShowPicker] = useState(false);
  const [userInput, setUserInput] = useState('');
  const [button1Pressed, setButton1Pressed] = useState(false);
  const [button2Pressed, setButton2Pressed] = useState(false);
  const [button3Pressed, setButton3Pressed] = useState(false);

  const handleButton1Press = () => {
    setButton1Pressed(!button1Pressed);
  };

  const handleButton2Press = () => {
    setButton2Pressed(!button2Pressed);
  };

  const handleButton3Press = () => {
    setButton3Pressed(!button3Pressed);
  };

  const currentDate = new Date();
  const newSymptomEntry = {
    totalWaterDrank: 22.0,
    date: currentDate.toLocaleString('en-US', { month: 'long', day: 'numeric' }),
    time: "10:03 AM",
    text: "I woke up feeling a little off. I am still feeling that way and also light headed like I may faint",
  };
  const [symptomsList, setSymptomsList] = useState([newSymptomEntry]);

  useEffect(() => {
    const intervalId = setInterval(() => {
      const currentTime = new Date();
      if (currentTime.getMinutes() !== selectedTime.getMinutes()) {
        setSelectedTime(currentTime);
      }
    }, 60000);

    return () => clearInterval(intervalId); 
  }, [selectedTime]); 

  useEffect(() => {
    const calculateTotalWaterDrank = () => {
      if (totalOzDevice !== null && !isNaN(totalOzDevice) && !isNaN(totalOzManual)) {
        const total = parseFloat(totalOzDevice) + parseFloat(totalOzManual);
        setTotalWaterDrank(total);
      }
    };
    calculateTotalWaterDrank();
  }, [totalOzDevice, totalOzManual]);
  
  const handleInputChange = (text) => {
    setUserInput(text);
  };

  const [drinkLogData, setDrinkLogData] = useState([
    { name: 'manual', amount: 6.0, time: '6:32 AM' },
    { name: 'manual', amount: 4.0, time: '7:20 AM' },
    { name: 'manual', amount: 5.0, time: '8:09 AM' },
    { name: 'manual', amount: 2.0, time: '8:51 AM' },
    { name: 'manual', amount: 2.0, time: '9:28 AM' },
    { name: 'manual', amount: 3.0, time: '9:55 AM' },
    { name: 'manual', amount: 5.0, time: '10:16 AM' },
    { name: 'manual', amount: 4.0, time: '10:58 AM' },
    { name: 'manual', amount: 3.0, time: '11:24 AM' },
    { name: 'manual', amount: 4.0, time: '11:47 AM' },
  ]);
  
  const [drinkLogDataUpcoming, setDrinkLogDataUpcoming] = useState([
    { amount: 8.5, time: '4:00 PM' },
    { amount: 8.5, time: '5:00 PM' },
    { amount: 17, time: '6:00 PM' },
    { amount: 8.5, time: '8:00 PM' },
    { amount: 4.3, time: '10:00 PM' },
  ]);

  const AhandleConfirm = () => {
    const timeString = selectedTime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
    const newLogItem = { name: 'manual', amount: parseFloat(selectedAmount), time: timeString };
    setDrinkLogData([...drinkLogData, newLogItem]);
    setTotalOzManual(prevTotalOzManual => prevTotalOzManual + parseFloat(selectedAmount));
    setAModalVisible(false);
  };

  const ShandleConfirm = () => {
    const waterGoal = calculateWaterGoal(userInfo, medicalConditions);
    setWaterGoal(waterGoal);
    setsModalVisible(false);
  };

  const onShare = async (opt) => {
    try {
      const currentDate = new Date().toLocaleDateString();
      let message = '';
      const userInfoMessage = `User Info:\n${Object.entries(userInfo)
        .map(([key, value]) => `${key.charAt(0).toUpperCase() + key.slice(1)}: ${value}`)
        .join('\n')}\nDaily Water Goal: ${waterGoal} oz`;
      const drinkLogDataMessage = `Drink Log for ${currentDate}:\n${drinkLogData
        .map(({ amount, time }) => `Amount: ${amount}, Time: ${time}`)
        .join('\n')}`;
      const symptomLogMessage = `Symptom Log:\n${symptomsList
        .map(({ time, date, totalWaterDrank, text }) => `-Time: ${time}, Date: ${date}, Water Drank: ${totalWaterDrank}oz, Description: ${text}`)
        .join('\n')}`;
      if (opt === 'day') {
        message = `${userInfoMessage}\n\n${drinkLogDataMessage}`;
      } else if (opt === 'symptom') {
        message = `${userInfoMessage}\n\n${symptomLogMessage}`;
      }
  
      const excludedTypes = Platform.OS === 'ios' ? ['com.apple.UIKit.activity.Message'] : [];
  
      const result = await Share.share({
        message,
        excludedActivityTypes: excludedTypes,
        subject: 'Patient Info',
        tintColor: 'white',
      });
  
      if (result.action === Share.sharedAction) {
        if (result.activityType) {
          // shared with activity type of result.activityType
        } else {
          // shared
        }
      } else if (result.action === Share.dismissedAction) {
        // dismissed
      }
    } catch (error) {
      Alert.alert(error.message);
    }
  };

  
  const toggleProfile = () => {
    setShowProfile(!showProfile);
  };

  const handleCancel = () => {
    setBModalVisible(false);
  };

  const AhandleCancel = () => {
    setAModalVisible(false);
  };
  
  const ShandleCancel = () => {
    setsModalVisible(false);
  };
  const handleOK = () => {
    setIModalVisible(false);

    requestNotificationPermission();
    setupNotificationHandler();
    scheduleNotification();
  };
  
  const handleSubmit = () => {
    const currentDate = new Date();
    const newSymptomEntry = {
      totalWaterDrank: totalWaterDrank,
      date: currentDate.toLocaleString('en-US', { month: 'long', day: 'numeric' }),
      time: currentDate.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true }),
      text: userInput,
    };
    setSymptomsList([...symptomsList, newSymptomEntry]);
    setUserInput('');
  };
  
  const DhandleOK = () => {
    setDModalVisible(false);
    setTotalWaterDrank(waterGoal);
    setDrinkLogData([{ name: 'manual', amount: 6.0, time: '6:32 AM' },
    { name: 'manual', amount: 4.0, time: '7:20 AM' },
    { name: 'manual', amount: 5.0, time: '8:09 AM' },
    { name: 'manual', amount: 2.0, time: '8:51 AM' },
    { name: 'manual', amount: 2.0, time: '9:28 AM' },
    { name: 'manual', amount: 3.0, time: '9:55 AM' },
    { name: 'manual', amount: 5.0, time: '10:16 AM' },
    { name: 'manual', amount: 4.0, time: '10:58 AM' },
    { name: 'manual', amount: 3.0, time: '11:24 AM' },
    { name: 'manual', amount: 4.0, time: '11:47 AM' },
    { name: 'manual', amount: 8.5, time: '2:00 PM' },
    { name: 'manual', amount: 8.5, time: '4:00 PM' },
    { name: 'manual', amount: 17.0, time: '6:00 PM' },
    { name: 'manual', amount: 8.5, time: '8:00 PM' },
    { name: 'manual', amount: 4.3, time: '10:00 PM' }]);
    setDrinkLogDataUpcoming([]);
  };

  const handleConfirm = () => {
    setBModalVisible(false);
    setBluetoothColor('#5DCCFC');
    setBluetoothColor2('white');
  };
  
  const onChange = (e, selectedTime) => {
    setSelectedTime(selectedTime);
  };
  
  const DonChange = (e, selectedDate) => {
    setSelectedDate(selectedDate);
  };
  
  const handleLogin = () => {
    setIsLoggedIn(true);
  };
  
  useEffect(() => {
    const totalOzRef = ref(db, 'totalOzDrank/');
    const drinkLogRef = ref(db, 'drinkLog/');
    const batteryPercentageRef = ref(db, 'batteryPercentage/');
  
    onValue(batteryPercentageRef, (snapshot) => {
      const bp = snapshot.val() || 0; 
      setBattery(bp.toFixed(0));
    });

    onValue(totalOzRef, (snapshot) => {
      const totalOzData = snapshot.val() || 0; 
      setTotalOzDevice(totalOzData.toFixed(1));
    });
  
    onValue(drinkLogRef, (snapshot) => {
      const drinkLogDataFromDb = snapshot.val() || {}; 
      const formattedDrinkLogData = Object.entries(drinkLogDataFromDb)
        .map(([mainKey, subArray]) => {
          const [timeValue, amountValue] = subArray;
          const timeInSeconds = parseInt(timeValue);
          const date = new Date(timeInSeconds * 1000);
          let hours = date.getHours();
          let minutes = date.getMinutes();
          const ampm = hours >= 12 ? 'PM' : 'AM';
          hours = hours % 12 || 12;
          minutes = minutes < 10 ? '0' + minutes : minutes;
          const formattedTime = `${hours}:${minutes} ${ampm}`;
          const entry = {
            time: formattedTime, 
            amount: parseFloat(amountValue).toFixed(1), 
            name: mainKey, 
          };
          return entry;
        });

      const filteredFormattedDrinkLogData = formattedDrinkLogData.filter(entry => {
        const shouldInclude = parseFloat(entry.amount) !== 0;
        return shouldInclude;
      });
      
      const updatedDrinkLogData = [...drinkLogData, ...filteredFormattedDrinkLogData];
      setDrinkLogData(updatedDrinkLogData);
    });
  }, []);
  
  const requestNotificationPermission = async () => {
    try {
      const { status } = await Notifications.requestPermissionsAsync();
      if (status === 'granted') {
        console.log('Notification permissions granted.');
      } else {
        console.log('Notification permissions denied.');
      }
    } catch (error) {
      console.error('Error requesting notification permissions:', error);
    }
  };
  
  const setupNotificationHandler = () => {
    Notifications.setNotificationHandler({
      handleNotification: async notification => {
        console.log('Received notification:', notification);
        return {
          shouldShowAlert: true,
          shouldPlaySound: false,
          shouldSetBadge: false,
        };
      },
    });
  };
  
  const scheduleNotification = async () => {
    try {
      await Notifications.scheduleNotificationAsync({
        content: {
          title: 'Drink Reminder',
          body: `You are ${(100 * totalWaterDrank/waterGoal).toFixed(1)}% done with your daily hydration goal, you need to drink ${(waterGoal - totalWaterDrank).toFixed(1)} oz more to stay on track`,
          icon: require('./assets/water.png'),
          color: '#000000',
          iosDisplayInForeground: true,
        },
        trigger: { seconds: 2 }, 
      });
    } catch (error) {
      console.error('Error scheduling notification:', error);
    }
  };

  const toggleMedicalCondition = (condition) => {
    if (medicalConditions.includes(condition)) {
      setMedicalConditions(medicalConditions.filter((c) => c !== condition));
    } else {
      setMedicalConditions([...medicalConditions, condition]);
    }
  };

  const calculateWaterGoal = (userInfo, medicalConditions) => {
    let waterGoal = (userInfo.weight / 2) + (12 * (userInfo.weeklyWorkouts / 7));
    if (userInfo.gender === 'Male') {
        waterGoal *= 1.1;
    }
    if (userInfo.age > 25) {
        waterGoal += (0.005 * (userInfo.age - 25)) * (userInfo.weight / 2);
    }
    if (medicalConditions.includes('POTS') && waterGoal < 85) {
        waterGoal = 85;
    }
    if (medicalConditions.includes('Kidney Stones') && waterGoal < 100) {
        waterGoal = 100;
    }
    if (medicalConditions.includes('UTI') && waterGoal > 100) {
        waterGoal = 100;
    } else if (medicalConditions.includes('UTI') && waterGoal < 68) {
        waterGoal = 68;
    }
    return Math.trunc(waterGoal);
};

  const handleContinue = () => {
    const waterGoal = calculateWaterGoal(userInfo, medicalConditions);
    setWaterGoal(waterGoal);
    setOnboardingComplete(true);
  };

  if (!isLoggedIn) {
    return (
      <View style={styles.container0}>
        <Image source={logo} style={[styles.logo, {top: 128}]} />        
        <Text style={styles.title}>
          <Text style={styles.createText}>  Create{'\n'}</Text>
          <Text style={styles.accountText}>Account</Text>
        </Text>
        <View style={styles.inputRow}>
          <Ionicons name="mail-outline" size={30} color="#141A1E" style={styles.inputIcon} />
          <TextInput
            style={styles.input}
            placeholder="Email"
            value={email}
            onChangeText={setEmail}
          />
        </View>
        <View style={styles.inputRow}>
          <Ionicons name="lock-closed-outline" size={30} color="#141A1E" style={styles.inputIcon} />
          <TextInput
            style={styles.input}
            placeholder="Password"
            secureTextEntry={true}
            value={password}
            onChangeText={setPassword}
          />
        </View>
        <TouchableOpacity style={styles.loginButton} onPress={handleLogin}>
          <Text style={styles.loginButtonText}>Create</Text>
        </TouchableOpacity>
        <StatusBar style="auto" />
      </View>
    );
  } else if (!onboardingComplete) {
    return (
      <OnboardingScreen
        userInfo={userInfo}
        setUserInfo={setUserInfo}
        handleContinue={handleContinue}
        toggleMedicalCondition={toggleMedicalCondition}
        inputValue={inputValue}
        medicalConditions={medicalConditions}
      />
    );
  } else if (showProfile) {
    return (
      <ProfileScreen
        userInfo={userInfo}
        medicalConditions={medicalConditions}
        toggleMedicalCondition={toggleMedicalCondition}
        toggleProfile={toggleProfile}
        totalOzManual={totalOzManual}
        totalOzDevice={totalOzDevice}
        totalWaterDrank={totalWaterDrank}
        handleInputChange={handleInputChange}
        userInput={userInput}
        handleSubmit={handleSubmit}
        symptomsList={symptomsList}
        waterGoal={waterGoal}
        onShare={onShare}
        sModalVisible={sModalVisible}
        setsModalVisible={setsModalVisible}
        ShandleCancel={ShandleCancel}
        ShandleConfirm={ShandleConfirm}
        setUserInfo={setUserInfo}
      />
    );
  } else return (
    <MainScreen
      waterGoal={waterGoal}
      handleButton1Press={handleButton1Press}
      button1Pressed={button1Pressed}      
      handleButton2Press={handleButton2Press}
      button2Pressed={button2Pressed}
      handleButton3Press={handleButton3Press}
      button3Pressed={button3Pressed}
      battery={battery}
      drinkLogData={drinkLogData}
      selectedDrink={selectedDrink}
      setSelectedDrink={setSelectedDrink}
      drinkLogDataUpcoming={drinkLogDataUpcoming}
      toggleProfile={toggleProfile} 
      setBModalVisible={setBModalVisible}
      BmodalVisible={BmodalVisible}
      setAModalVisible={setAModalVisible}
      AmodalVisible={AmodalVisible}
      DmodalVisible={DmodalVisible}
      setDModalVisible={setDModalVisible}
      setIModalVisible={setIModalVisible}
      ImodalVisible={ImodalVisible}
      selectedTime={selectedTime}
      selectedAmount={selectedAmount}
      setSelectedAmount={setSelectedAmount}
      setSelectedTime={setSelectedTime}
      showPicker={showPicker}
      handleCancel={handleCancel}
      AhandleCancel={AhandleCancel}
      handleOK={handleOK}
      DhandleOK={DhandleOK}
      handleConfirm={handleConfirm}
      AhandleConfirm={AhandleConfirm}
      bluetoothColor={bluetoothColor}
      bluetoothColor2={bluetoothColor2}
      userInfo={userInfo}
      medicalConditions={medicalConditions}
      onChange={onChange}
      DonChange={DonChange}
      totalOzManual={totalOzManual}
      totalOzDevice={totalOzDevice}
      totalWaterDrank={totalWaterDrank}
      onShare={onShare}
      selectedDate={selectedDate}
    />
  ); 
  }

const OnboardingScreen = ({ userInfo, setUserInfo, handleContinue, toggleMedicalCondition, inputValue, medicalConditions }) => {
  return (
    <KeyboardAwareScrollView contentContainerStyle={styles.container} style={{ backgroundColor: '#F4F8FB' }}>
    <View style={styles.container2}>
      <Image source={logo} style={[styles.logo, {alignSelf: 'center'}]} />        
      <Text style={styles.onboardingTitle}>The following information is needed{'\n'}to personalize your hydration goals</Text>
      <View style={styles.inputRow}>
        <Ionicons name="person-outline" size={24} color="#5DCCFC"/>
        <Text style={styles.inputCategory}>Name</Text>
        <TextInput
          style={styles.inputField}
          value={userInfo.name}
          onChangeText={(name) => setUserInfo({...userInfo, name})}
        />
      </View>
      <View style={styles.inputRow}>
        <Ionicons name="calendar-clear-outline" size={24} color="#5DCCFC"/>
        <Text style={styles.inputCategory}>Age</Text>
        <TextInput
          style={styles.inputField}
          keyboardType="numeric"
          returnKeyType="done"
          value={userInfo.age}
          onChangeText={(age) => setUserInfo({...userInfo, age})}
        />
      </View>
      <View style={styles.inputRow}>
        <Ionicons name="accessibility-outline" size={24} color="#5DCCFC"/>
        <Text style={styles.inputCategory}>Gender</Text>
        <View style={styles.genderContainer}>
          <TouchableOpacity style={[styles.genderOption, userInfo.gender === 'Male' && styles.genderOptionSelected]} onPress={() => setUserInfo({...userInfo, gender: 'Male'})}>
            <Text style={[styles.genderOptionText, userInfo.gender === 'Male' && styles.selectedText]}>Male</Text>
          </TouchableOpacity>
          <TouchableOpacity style={[styles.genderOption, userInfo.gender === 'Female' && styles.genderOptionSelected]} onPress={() => setUserInfo({...userInfo, gender: 'Female'})}>
            <Text style={[styles.genderOptionText, userInfo.gender === 'Female' && styles.selectedText]}>Female</Text>
          </TouchableOpacity>
          <TouchableOpacity style={[styles.genderOption, userInfo.gender === 'other' && styles.genderOptionSelected]} onPress={() => setUserInfo({...userInfo, gender: 'other'})}>
            <Text style={[styles.genderOptionText, userInfo.gender === 'other' && styles.selectedText]}>Other</Text>
          </TouchableOpacity>
        </View>
      </View>
      <View style={styles.inputRow}>
        <Ionicons name="scale-outline" size={24} color="#5DCCFC"/>
        <Text style={styles.inputCategory}>Weight</Text>
        <TextInput
          style={styles.inputField}
          keyboardType="numeric"
          returnKeyType="done"
          value={userInfo.weight}
          onChangeText={(weight) => setUserInfo({...userInfo, weight})}
        />
      </View>
      <View style={styles.inputRow}>
        <Ionicons name="barbell-outline" size={24} color="#5DCCFC"/>
        <Text style={styles.inputCategory}>Weekly Workouts</Text>
        <TextInput
          style={styles.inputField}
          keyboardType="numeric"
          returnKeyType="done"
          maxLength={1} 
          value={userInfo.weeklyWorkouts}
          onChangeText={(text) => {
            const newValue = parseInt(text);
            if (!isNaN(newValue) && newValue >= 0 && newValue <= 7) {
              setUserInfo({ ...userInfo, weeklyWorkouts: text });
            } else {
              setUserInfo({ ...userInfo, weeklyWorkouts: '' });
            }
          }}
        />
      </View>
      <View style={styles.inputRowL}>
        <Ionicons name="medkit-outline" size={24} color="#5DCCFC"/>
        <Text style={[styles.inputCategory]}>Medical Condition(s)</Text>
      </View>
      <View style={[styles.medicalButtonsContainer, { marginLeft: 0 }]}>
        <TouchableOpacity
          style={[styles.medicalButton, medicalConditions.includes('POTS') && styles.medicalButtonSelected]}
          onPress={() => toggleMedicalCondition('POTS')}
        >
          <Text style={[styles.medicalButtonText, medicalConditions.includes('POTS') && { color: 'white' }]}>POTS</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[styles.medicalButton, medicalConditions.includes('UTI') && styles.medicalButtonSelected]}
          onPress={() => toggleMedicalCondition('UTI')}
        >
          <Text style={[styles.medicalButtonText, medicalConditions.includes('UTI') && { color: 'white' }]}>UTI</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[styles.medicalButton, medicalConditions.includes('Kidney Stones') && styles.medicalButtonSelected]}
          onPress={() => toggleMedicalCondition('Kidney Stones')}
        >
          <Text style={[styles.medicalButtonText, medicalConditions.includes('Kidney Stones') && { color: 'white' }]}>Kidney Stones</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[styles.medicalButton, medicalConditions.includes('Pregnant') && styles.medicalButtonSelected]}
          onPress={() => toggleMedicalCondition('Pregnant')}
        >
          <Text style={[styles.medicalButtonText, medicalConditions.includes('Pregnant') && { color: 'white' }]}>Pregnant</Text>
        </TouchableOpacity>
      </View>
      <View style={styles.continueButtonContainer}>
        <TouchableOpacity style={styles.continueButton} onPress={handleContinue}>
          <Text style={styles.continueButtonText}>Continue</Text>
        </TouchableOpacity>
      </View>
      <StatusBar style="auto" />
    </View>
    </KeyboardAwareScrollView>
  );
};

const MainScreen = ({ waterGoal, handleButton1Press, button1Pressed, handleButton2Press, button2Pressed, handleButton3Press, button3Pressed,battery, selectedDrink, setSelectedDrink, onShare, totalOzManual, totalOzDevice, totalWaterDrank, drinkLogData, drinkLogDataUpcoming, selectedDate, userInfo, onChange, DonChange, medicalConditions, toggleProfile, setSelectedAmount, setSelectedTime, DmodalVisible, setDModalVisible, setBModalVisible, BmodalVisible, setAModalVisible, AmodalVisible, selectedTime, selectedAmount, showPicker, setIModalVisible, ImodalVisible, handleCancel, AhandleCancel, AhandleConfirm, handleOK,DhandleOK, handleConfirm, bluetoothColor, bluetoothColor2 }) => {
  const radius = 80;
  const circumference = 2 * Math.PI * radius;
  const waterPercentage = Math.trunc((totalWaterDrank / waterGoal) * 100); 
  const waterText = `${totalWaterDrank}oz / ${waterGoal}oz`;
  const waterPercentageText = `${waterPercentage}%`;
  const strokeDashoffset = circumference * (1 - waterPercentage / 100)
  const hourlySums = Array.from({ length: 24 }, () => 0);

  drinkLogData.forEach(entry => {
    const [time, period] = entry.time.split(' '); 
    const [hourStr, minuteStr] = time.split(':'); 
    const hour = parseInt(hourStr, 10); 
    const minute = parseInt(minuteStr, 10);
    const adjustedHour = period === 'PM' && hour !== 12 ? hour + 12 : hour; 

    const index = adjustedHour ; 

    hourlySums[index] += parseFloat(entry.amount);
  });

const data = hourlySums.reduce((acc, amount, index) => {
  if (index > 0) {
    const previousAmount = parseFloat(acc[index - 1]);
    const nextAmounts = hourlySums.slice(index + 1);
    const allZeroAfter = nextAmounts.every(val => val === 0);

    if (amount === 0 && allZeroAfter) {
      acc.push(0);
    } else {
      const accumulated = amount === 0 ? previousAmount : amount + previousAmount;
      acc.push(accumulated.toFixed(1));
    }
  } else {
    acc.push(amount.toFixed(1));
  }
  return acc;
}, []);

  const chartData = {
    labels: ['12a', '3a', '6a', '9a', '12p', '3p', '6p', '9p', '12a'],
    datasets: [
      {
        data: data, 
        color: (opacity = 1) => `rgba(0, 204, 252, ${opacity})`, 
        strokeWidth: 2, 
        withDots: false, 
      },
    ],
  };

  return (
    <View style={[{ backgroundColor: '#F4F8FB' }]}>
      <ScrollView contentContainerStyle={{ flexGrow: 1 }} showsVerticalScrollIndicator={false}>
        <View style={[styles.container, {marginBottom: 64}]}>
          <View style={styles.buttonContainer}>
            <TouchableOpacity style={[styles.button, { backgroundColor: bluetoothColor }, getShadowStyles()]} onPress={() =>setBModalVisible(true)}>
              <Ionicons name="bluetooth" size={24} color={bluetoothColor2} />
            </TouchableOpacity>
          </View>
          <TouchableOpacity style={[ styles.buttonWide, getShadowStyles(),{ marginTop: 72 },]} onPress={() =>setDModalVisible(true)} >
            <Ionicons name="calendar-clear-outline" size={24} color="#5DCCFC" style={styles.buttonIcon} />
            <Text style={[styles.buttonText, { color: "#5DCCFC" }]}>
              {new Date(selectedDate).toLocaleDateString('en-US', { month: 'long', day: 'numeric' })}
            </Text>
          </TouchableOpacity>
          <BluetoothModal
              visible={BmodalVisible}
              onCancel={handleCancel}
              onConfirm={handleConfirm}
              battery={battery}
              handleButton1Press={handleButton1Press}
              button1Pressed={button1Pressed}
              handleButton2Press={handleButton2Press}
              button2Pressed={button2Pressed} 
              handleButton3Press={handleButton3Press}
              button3Pressed={button3Pressed}
          />
          <ManualAddModal
              visible={AmodalVisible}
              selectedDrink={selectedDrink}
              setSelectedDrink={setSelectedDrink}
              onCancel={AhandleCancel}
              onConfirm={AhandleConfirm}
              onChange={onChange}
              selectedTime={selectedTime}
              setSelectedAmount={setSelectedAmount}
              setSelectedTime={setSelectedTime}
              selectedAmount={selectedAmount}
              showPicker={showPicker}
          />
          <DateModal
              visible={DmodalVisible}
              onOK={DhandleOK}
              setDModalVisible={setDModalVisible}
              showPicker={showPicker}
              DonChange={DonChange}
              selectedDate={selectedDate}
          />
          <InfoModal
            visible={ImodalVisible}
            onOK={handleOK}
            userInfo={userInfo}
            medicalConditions={medicalConditions}
          />
          <View style={[styles.buttonContainer, styles.buttonContainerRight]}>
            <TouchableOpacity
                style={[styles.button, getShadowStyles()]}   onPress={toggleProfile}>
                <Ionicons name="person" size={24} color="#5DCCFC" />
            </TouchableOpacity>
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center',marginTop: 32, }}>
            <Text style={styles.waterTitle}>Daily Goal</Text>
            <TouchableOpacity onPress={() =>setIModalVisible(true)}>
              <Ionicons 
                name="information-circle" 
                size={20}
                color="#141A1E" 
                style={{ marginLeft: 4, marginTop: -8, opacity: 0.2 }} 
              />
            </TouchableOpacity>
          </View>          
          <Svg height="200" width="200">
            <Circle
              cx="100"
              cy="100"
              r={radius}
              fill="none"
              stroke="#8EDCFC" 
              strokeWidth="10"
              opacity={0.5} 
            />
            <Circle
              cx="100"
              cy="100"
              r={radius}
              fill="none"
              stroke="#5DCCFC" 
              strokeWidth="10"
              strokeDasharray={circumference}
              strokeDashoffset={strokeDashoffset}
              transform="rotate(90, 100, 100) scale(-1, 1) translate(-200, 0)" 
            />
            <SvgText
              x="50%"
              y="50%"
              textAnchor="middle"
              fontSize="32"
              fill="#5DCCFC" 
              fontWeight="bold" 
            >
              {waterPercentageText}
            </SvgText>
            <SvgText
              x="50%"
              y="64%"
              textAnchor="middle"
              fontSize="10"
              fill="#141A1E"
            >
              {waterText}
            </SvgText>
          </Svg>
          <TouchableOpacity style={[styles.shareButton, getShadowStyles()]} onPress={() => onShare('day')}>
            <Ionicons name="share-outline" size={24} color="white" style={styles.buttonIcon} />
            <Text style={styles.buttonText}>Share Today's Progress</Text>
          </TouchableOpacity>
          <View style={styles.chartTitleContainer}>
            <Text style={styles.chartTitle}>Hourly Intake</Text>
          </View>
          <View style={styles.chartContainer}>
            <View style={{ right: 12 }}>
              <LineChart
                data={chartData}
                width={300}
                height={200}
                yAxisSuffix=" Oz"
                yAxisInterval={10}
                withShadow = {true}
                withInnerLines = {false}
                withOuterLines = {false}
                chartConfig={{
                  backgroundGradientFrom: '#F4F8FB',
                  backgroundGradientTo: '#F4F8FB',
                  decimalPlaces: 0,
                  strokeWidth: 3, 
                  color: (opacity = 1) => `rgba(93, 204, 252, ${opacity})`,
                  labelColor: (opacity = 1) => `rgba(20, 26, 30, ${opacity})`,
                }}
                bezier
                style={styles.chart}
              />
            </View>
          </View>
          <View style={styles.drinkLogSection}>
            <Text style={[styles.chartTitle, { marginBottom: 16 }]}>Drink Log</Text>
            {drinkLogData.map((item, index) => (
              <View key={index} style={styles.drinkLogItem}>
                <Text style={styles.drinkLogTime}>{item.time}</Text>
                <Text style={styles.drinkLogText}>Water</Text>
                <Text style={styles.drinkLogAmount}>{item.amount} oz</Text>
              </View>
            ))}
          </View>
          {drinkLogDataUpcoming.length > 0 && (
            <View style={styles.drinkLogSection}>
              <Text style={[styles.chartTitle, { marginBottom: 16 }]}>Upcoming</Text>
              {drinkLogDataUpcoming.map((item, index) => (
                <View key={index} style={styles.drinkLogItemUpcoming}>
                  <Text style={styles.drinkLogTimeUpcoming}>{item.time}</Text>
                  <Text style={styles.drinkLogTextUpcoming}>Water</Text>
                  <Text style={styles.drinkLogAmountUpcoming}>{item.amount} oz</Text>
                </View>
              ))}
            </View>
          )}
          <StatusBar style="auto" />
        </View>
      </ScrollView>
      <TouchableOpacity style={[styles.plusButton, getShadowStyles(),{shadowOpacity: 0.5, shadowRadius: 16,}]} onPress={() =>setAModalVisible(true)}>
        <Ionicons name="add-circle-outline" size={48} color="#5DCCFC" strokeWidth={200} />
      </TouchableOpacity>
    </View>
  );
};

const BluetoothModal = ({ visible, onCancel, onConfirm, battery, handleButton1Press, button1Pressed, handleButton3Press, button3Pressed, handleButton2Press, button2Pressed}) => {
  return (
    <Modal visible={visible} animationType="fade" transparent={true}>
      <View style={styles.modalContainer}>
        <View style={styles.modalContent}>
          <Text style={styles.modalTextTitle}>Bluetooth Setup Instructions</Text>
          {/* <Text style={styles.modalText}>Setup Instructions</Text> */}
          <View style={styles.buttonContainer3}>
            <Text style={[styles.modalText, {marginBottom: 12, textAlign: 'center'}]}>Connect to bluetooth device</Text>
            <TouchableOpacity
              style={[styles.buttonBubble2, button1Pressed && styles.buttonBubble, {marginBottom: 16}]}
              onPress={handleButton1Press}
            >
              <Text style={[styles.CancelText, button1Pressed && styles.ConfirmText]}>Connect</Text>
            </TouchableOpacity>            
            <Text style={[styles.modalText, {marginBottom: 12, textAlign: 'center'}]}>Place the boot on a surface & press ‘Pre-Tare’ to calibrate its weight</Text>
            <TouchableOpacity
              style={[styles.buttonBubble2, button2Pressed && styles.buttonBubble, {marginBottom: 16}]}
              onPress={handleButton2Press}
            >
              <Text style={[styles.CancelText, button2Pressed && styles.ConfirmText]}>Pre-Tare</Text>
            </TouchableOpacity>
            <Text style={[styles.modalText, {marginBottom: 12, textAlign: 'center'}]}>Insert an empty bottle into the boot and press ‘Post-Tare’ to calibrate the combined weight</Text>
            <TouchableOpacity
              style={[styles.buttonBubble2, button3Pressed && styles.buttonBubble, {marginBottom: 16}]}
              onPress={handleButton3Press}
            >
              <Text style={[styles.CancelText, button3Pressed && styles.ConfirmText]}>Post-Tare</Text>
            </TouchableOpacity>
          </View>
          <Text style={[styles.modalText, {alignSelf: 'center'}]}>Device Battery: <Text style={{ fontWeight: 'bold' }}>{battery}%</Text></Text>
          <View style={styles.buttonContainer2}>
            <TouchableOpacity style={[styles.buttonBubble2, styles.cancelButton]} onPress={onCancel}>
              <Text style={styles.CancelText}>Cancel</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.buttonBubble} onPress={onConfirm}>
              <Text style={styles.ConfirmText}>Finish</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
};

const ManualAddModal = ({ visible, selectedDrink, setSelectedDrink, onCancel, onConfirm, selectedTime, selectedAmount, onChange, setSelectedAmount, setSelectedTime, showPicker, drinkLogData, setDrinkLogData }) => {
  return (
    <Modal visible={visible} animationType="fade" transparent={true}>
      <View style={styles.modalContainer}>
        <View style={styles.modalContent}>
          <Text style={styles.modalTextTitle}>Add Manual Intake</Text>
          <View style={styles.inputRow}>
            <Ionicons name="time-outline" size={24} color="#5DCCFC"/>
            <Text style={styles.inputCategory}>Time of Drink</Text>
            <DateTimePicker
              value={selectedTime} 
              mode="time"
              onChange={onChange}
              display='compact'
              accentColor='#5DCCFC'
            />
          </View>
          <View style={styles.inputRow}>
            <Ionicons name="water-outline" size={24} color="#5DCCFC"/>
            <Text style={styles.inputCategory}>Amount (Oz)</Text>
            <TextInput
              style={styles.inputField}
              keyboardType="numeric"
              returnKeyType="done"
              onChangeText={setSelectedAmount}
            />
          </View>
          <View style={[styles.inputRowL, {marginBottom: 32}]}>
            <Ionicons name="cafe-outline" size={24} color="#5DCCFC"/>
            <Text style={styles.inputCategory}>Type</Text>
            <TouchableOpacity
            style={[styles.medicalButton, selectedDrink === 'water' && styles.medicalButtonSelected]}
            onPress={() => setSelectedDrink('water')}
          >
            <Text style={[styles.medicalButtonText, selectedDrink === 'water' && { color: 'white' }]}>Water</Text>
          </TouchableOpacity>
          <TouchableOpacity
            style={[styles.medicalButton, selectedDrink === 'coffee' && styles.medicalButtonSelected]}
            onPress={() => setSelectedDrink('coffee')}
          >
            <Text style={[styles.medicalButtonText, selectedDrink === 'coffee' && { color: 'white' }]}>Coffee</Text>
          </TouchableOpacity>
          </View>
          <View style={styles.buttonContainer2}>
            <TouchableOpacity style={[styles.buttonBubble2, styles.cancelButton]} onPress={onCancel}>
              <Text style={styles.CancelText}>Cancel</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.buttonBubble} onPress={onConfirm}>
              <Text style={styles.ConfirmText}>Confirm</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
};

const SettingsModal = ({ visible, onCancel, onConfirm, onChange, userInfo, setUserInfo, medicalConditions,toggleMedicalCondition}) => {
  return (
    <Modal visible={visible} animationType="fade" transparent={true}>
      <View style={styles.modalContainer}>
        <View style={styles.modalContent}>
          <Text style={styles.modalTextTitle}>Settings</Text>
          <View style={styles.inputRow}>
            <Ionicons name="person-outline" size={24} color="#5DCCFC"/>
            <Text style={styles.inputCategory}>Name</Text>
            <TextInput
              style={styles.inputField}
              value={userInfo.name}
              onChangeText={(name) => setUserInfo({...userInfo, name})}
            />
          </View>
          <View style={styles.inputRow}>
            <Ionicons name="calendar-clear-outline" size={24} color="#5DCCFC"/>
            <Text style={styles.inputCategory}>Age</Text>
            <TextInput
              style={styles.inputField}
              keyboardType="numeric"
              returnKeyType="done"
              value={userInfo.age}
              onChangeText={(age) => setUserInfo({...userInfo, age})}
            />
          </View>
          <View style={styles.inputRow}>
            <Ionicons name="accessibility-outline" size={24} color="#5DCCFC"/>
            <Text style={styles.inputCategory}>Gender</Text>
            <View style={styles.genderContainer}>
              <TouchableOpacity style={[styles.genderOption, userInfo.gender === 'Male' && styles.genderOptionSelected]} onPress={() => setUserInfo({...userInfo, gender: 'Male'})}>
                <Text style={[styles.genderOptionText, userInfo.gender === 'Male' && styles.selectedText]}>Male</Text>
              </TouchableOpacity>
              <TouchableOpacity style={[styles.genderOption, userInfo.gender === 'Female' && styles.genderOptionSelected]} onPress={() => setUserInfo({...userInfo, gender: 'Female'})}>
                <Text style={[styles.genderOptionText, userInfo.gender === 'Female' && styles.selectedText]}>Female</Text>
              </TouchableOpacity>
            </View>
          </View>
          <View style={styles.inputRow}>
            <Ionicons name="scale-outline" size={24} color="#5DCCFC"/>
            <Text style={styles.inputCategory}>Weight</Text>
            <TextInput
              style={styles.inputField}
              keyboardType="numeric"
              returnKeyType="done"
              value={userInfo.weight}
              onChangeText={(weight) => setUserInfo({...userInfo, weight})}
            />
          </View>
          <View style={styles.inputRow}>
            <Ionicons name="barbell-outline" size={24} color="#5DCCFC"/>
            <Text style={styles.inputCategory}>Weekly Workouts</Text>
            <TextInput
              style={styles.inputField}
              keyboardType="numeric"
              returnKeyType="done"
              maxLength={1} 
              value={userInfo.weeklyWorkouts}
              onChangeText={(text) => {
                const newValue = parseInt(text);
                if (!isNaN(newValue) && newValue >= 0 && newValue <= 7) {
                  setUserInfo({ ...userInfo, weeklyWorkouts: text });
                } else {
                  setUserInfo({ ...userInfo, weeklyWorkouts: '' });
                }
              }}
            />
          </View>
          <View style={styles.inputRowL}>
            <Ionicons name="medkit-outline" size={24} color="#5DCCFC"/>
            <Text style={[styles.inputCategory]}>Medical Condition(s)</Text>
            <TouchableOpacity
              style={[styles.medicalButton, medicalConditions.includes('POTS') && styles.medicalButtonSelected]}
              onPress={() => toggleMedicalCondition('POTS')}
            >
              <Text style={[styles.medicalButtonText, medicalConditions.includes('POTS') && { color: 'white' }]}>POTS</Text>
            </TouchableOpacity>
          </View>
          <View style={[styles.medicalButtonsContainer, { marginTop: 8, marginBottom: 32 }]}>
            <TouchableOpacity
              style={[styles.medicalButton, medicalConditions.includes('UTI') && styles.medicalButtonSelected]}
              onPress={() => toggleMedicalCondition('UTI')}
            >
              <Text style={[styles.medicalButtonText, medicalConditions.includes('UTI') && { color: 'white' }]}>UTI</Text>
            </TouchableOpacity>
            <TouchableOpacity
              style={[styles.medicalButton, medicalConditions.includes('Kidney Stones') && styles.medicalButtonSelected]}
              onPress={() => toggleMedicalCondition('Kidney Stones')}
            >
              <Text style={[styles.medicalButtonText, medicalConditions.includes('Kidney Stones') && { color: 'white' }]}>Kidney Stones</Text>
            </TouchableOpacity>
            <TouchableOpacity
              style={[styles.medicalButton, medicalConditions.includes('Pregnant') && styles.medicalButtonSelected]}
              onPress={() => toggleMedicalCondition('Pregnant')}
            >
              <Text style={[styles.medicalButtonText, medicalConditions.includes('Pregnant') && { color: 'white' }]}>Pregnant</Text>
            </TouchableOpacity>
          </View>
          <View style={styles.buttonContainer2}>
            <TouchableOpacity style={[styles.buttonBubble2, styles.cancelButton]} onPress={onCancel}>
              <Text style={styles.CancelText}>Cancel</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.buttonBubble} onPress={onConfirm}>
              <Text style={styles.ConfirmText}>Confirm</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
};

const DateModal = ({ visible, onOK, setDModalVisible, onCancel, onConfirm, selectedTime, selectedDate, selectedAmount, DonChange, setSelectedAmount, setSelectedTime, showPicker, drinkLogData, setDrinkLogData }) => {
  return (
    <Modal visible={visible} animationType="fade" transparent={true}>
    <View style={styles.modalContainer}>
      <View style={[styles.modalContent,{alignItems: 'center'}]}>
        <Text style={styles.modalTextTitle}>Select Date</Text>
        <DateTimePicker
              value={selectedDate} 
              mode="date"
              onChange={DonChange}
              isVisible={true}
              accentColor='#5DCCFC'
              style={styles.datePicker}
        />
        <TouchableOpacity style={styles.buttonBubble} onPress={onOK} >
          <Text style={styles.ConfirmText}>OK</Text>
        </TouchableOpacity>
      </View>
    </View>
  </Modal>
    
  );
};

const InfoModal = ({ visible, onOK, userInfo, medicalConditions }) => {
  return (
    <Modal visible={visible} animationType="fade" transparent={true}>
      <View style={styles.modalContainer}>
        <View style={[styles.modalContent,{alignItems: 'center'}]}>
          <Text style={styles.modalTextTitle}>Understanding your Daily Goal</Text>
          <Text style={styles.modalText}>
            The amount of water you should drink per day is calculated based on:
            {'\n\n'}
            <Text style={{ fontWeight: 'bold',  }}>Age:</Text>{' '}
            Affects metabolic rate, kidney function, & body water makeup. Older individuals need more water
            {'\n\n'}
            <Text style={{ fontWeight: 'bold' }}>Gender:</Text>{' '}
            Males generally need more water due to higher muscle mass & metabolic rates
            {'\n\n'}
            <Text style={{ fontWeight: 'bold' }}>Weight:</Text>{' '}
            Heavier individuals require more water intake
            {'\n\n'}
            <Text style={{ fontWeight: 'bold' }}>Weekly Workouts:</Text>{' '}
            Active individuals sweat more & have higher metabolic rates, requiring more water
            {'\n\n'}
            <Text style={{ fontWeight: 'bold' }}>Medical Conditions:</Text>{' '}
            {'\n\u2022'}
            <Text style={{ fontWeight: 'bold' }}>POTS:</Text>{' '}
             85oz (min) of water daily, along with salt, to increase blood volume
            {'\n\u2022'}
            <Text style={{ fontWeight: 'bold' }}>UTI:</Text>{' '}
            65oz (min) & 100oz (max) daily to flush out bacteria
            {'\n\u2022'}
            <Text style={{ fontWeight: 'bold' }}>Kidney Stones:</Text>{' '}
            100oz (min) daily to dilute urine & prevent stones forming
            {'\n\n'}
            Please consult a medical professional for further questions
          </Text>
          <TouchableOpacity style={styles.buttonBubble} onPress={onOK} >
            <Text style={styles.ConfirmText}>OK</Text>
          </TouchableOpacity>
        </View>
      </View>
    </Modal>
  );
};

const CompletionCircle = ({ label, successDays }) => {
  const radius = 32;
  const circumference = 2 * Math.PI * radius;
  const waterPercentage = Math.trunc((successDays / 30) * 100);
  const waterPercentageText = `${waterPercentage}%`;
  const strokeDashoffset = circumference * (1 - waterPercentage / 100);

  return (
    <Svg height="130" width="160" style={[styles.svgContainer, {marginTop: -18}]}>
      <SvgText
        x="50%"
        y="28%"
        textAnchor="middle"
        fontSize="14"
        fill="#141A1E"
        fontWeight={'600'}
        opacity={0.5}
      >
        {label}
      </SvgText>
      <Circle
        cx="80"
        cy="80"
        r={radius}
        fill="none"
        stroke="#8EDCFC"
        strokeWidth="4"
        opacity={0.5}
      />
      <Circle
        cx="80"
        cy="80"
        r={radius}
        fill="none"
        stroke="#5DCCFC"
        strokeWidth="4"
        strokeDasharray={circumference}
        strokeDashoffset={strokeDashoffset}
        transform="rotate(90, 100, 100) scale(-1, 1) translate(-160, 40)"
      />
      <SvgText
        x="50%"
        y="67%"
        textAnchor="middle"
        fontSize="18"
        fill="#5DCCFC"
        fontWeight={'600'}
      >
        {waterPercentageText}
      </SvgText>
    </Svg>
  );
};

const ProfileScreen = ({ userInfo, toggleProfile, onShare, setUserInfo, medicalConditions, sModalVisible, toggleMedicalCondition,setsModalVisible, ShandleCancel, ShandleConfirm, totalOzManual, totalOzDevice, totalWaterDrank, handleInputChange, userInput, handleSubmit, symptomsList, waterGoal }) => {
  return (
    <KeyboardAwareScrollView style={{ backgroundColor: '#F4F8FB' }}>
      <View style={[styles.container, {marginBottom: 24}]}>
      <SettingsModal
              visible={sModalVisible}
              onCancel={ShandleCancel}
              onConfirm={ShandleConfirm}
              medicalConditions={medicalConditions}
              toggleMedicalCondition={toggleMedicalCondition}
              userInfo={userInfo}
              setUserInfo={setUserInfo}
      />
      <TouchableOpacity style={[styles.circularButton, styles.backButton, getShadowStyles()]} onPress={toggleProfile}>
        <Ionicons name="chevron-back-outline" size={24} color="#5DCCFC" />
      </TouchableOpacity>
      <TouchableOpacity style={[styles.circularButton, styles.settingsButton, getShadowStyles()]} onPress={() =>setsModalVisible(true)}>
        <Ionicons name="settings-outline" size={24} color="#5DCCFC" />
      </TouchableOpacity>
      <View style={styles.profileMain}>
        <View style={styles.profileInitialCircle}>
          <Text style={styles.initialText}>{userInfo.name.charAt(0)}</Text>
        </View>
        <Text style={styles.fullName}>{userInfo.name}</Text>
        <Text style={styles.profileTitle}>Monthly Completion</Text>
        <View style={[styles.profileRow2]}>
          <CompletionCircle label="January" successDays={22} />
          <CompletionCircle label="February" successDays={15} />
          <CompletionCircle label="March" successDays={27} />
        </View>
      <Text style={styles.profileTitle}>Symptom Log</Text>
      <View style={styles.profileRow}>
        <View style={styles.textRow}>
        <Text style={[styles.symCat, { lineHeight: 24 }]}>
        <Text style={{ fontWeight: 'bold' }}>Water Drank:</Text> {totalWaterDrank}oz</Text>
        <Text style={[styles.symCat, { lineHeight: 24 }]}>
        <Text style={{ fontWeight: 'bold' }}>Date:</Text> {new Date().toLocaleString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })} </Text>
        <Text style={[styles.symCat, { lineHeight: 24 }]}>   
        <Text style={{ fontWeight: 'bold' }}>Time:</Text> {new Date().toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })} </Text>
      </View>
      <View style={styles.verticalLine}></View> 
      <View style={styles.textBoxContainer}>
        <TextInput
          style={styles.bigTextBox}
          placeholder="Describe your symptoms here..."
          onChangeText={handleInputChange}
          value={userInput}
          multiline
        />
        <TouchableOpacity style={styles.submitButtonBubble} onPress={handleSubmit} >
          <Text style={styles.SubmitText}>Submit</Text>
        </TouchableOpacity>
      </View>
      </View>
      {symptomsList.length > 0 && (
        <>
          <Text style={styles.profileTitle}>History</Text>
          {symptomsList.map((symptom, index) => (
            <View key={index} style={styles.symItem}>
              <View style={styles.symItemHeader}>
                <Text style={styles.symItemHeaderText}>{symptom.time}, {symptom.date}</Text>
                <Text style={styles.symItemHeaderText}>{symptom.totalWaterDrank}oz / {waterGoal}oz</Text>
              </View>
              <Text style={styles.symItemText}>{symptom.text}</Text>
            </View>
          ))} 
          <TouchableOpacity style={[styles.shareButton, getShadowStyles(), {marginTop: 12}]} onPress={() => onShare('symptom')}>
            <Ionicons name="share-outline" size={24} color="white" style={styles.buttonIcon} />
            <Text style={styles.buttonText}>Share Symptom Log</Text>
          </TouchableOpacity>
        </>
      )}
      </View>
    </View>
  </KeyboardAwareScrollView>
  );
};

const commonButtonStyles = {
  padding: 4,
  borderRadius: 24,
  backgroundColor: 'white',
  alignItems: 'center',
  justifyContent: 'center',
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F4F8FB',
    alignItems: 'center',
    paddingHorizontal: 20,
    position: 'relative', 
  },
  container0: {
    flex: 1,
    backgroundColor: '#F4F8FB',
    alignItems: 'center',
    justifyContent: 'center',
    paddingHorizontal: 20,
  },
  container2: {
    flex: 1,
    backgroundColor: '#F4F8FB',
    justifyContent: 'center',
    paddingHorizontal: 48,
  },
  title: {
    fontSize: 64,
    fontWeight: 'bold',
    marginBottom: 64,
  },
  onboardingTitle: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#141A1E',
    textAlign: 'center',
    marginBottom: 64,
    marginTop: 64,
  },
  createText: {
    color: '#141A1E',
  },
  accountText: {
    color: '#5DCCFC',
  },
  input: {
    height: 40,
    width: '80%',
    borderColor: '#141A1E',
    borderWidth: 1,
    marginBottom: 0,
    paddingHorizontal: 12,
    borderRadius: 8,
    fontSize: 16,
  },
  inputRow: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 24,
  },

  profileRow: {
    marginTop: 0,
    flexDirection: 'row',
    justifyContent: 'center',
    paddingHorizontal: 12, 
    paddingVertical: 12, 
    backgroundColor: '#F5F5F5', 
    borderRadius: 16, 
    borderColor: '#141A1E',
    borderWidth: 1,
    width: 310,
  },  
  profileRow2: {
    marginTop: 0,
    flexDirection: 'row',
    justifyContent: 'center',
    paddingHorizontal: 12, 
    paddingVertical: 12, 
    backgroundColor: '#F5F5F5', 
    borderRadius: 16, 
    borderColor: '#141A1E',
    borderWidth: 1,
    width: 310,
    height: 128,
  },
  svgContainer: {
    marginHorizontal: -32, 
    alignItems: 'center',
  },
  inputIcon: {
    marginRight: 8, 
  },
  inputRowL: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'left',
  },
  inputCategory: {
    fontSize: 16,
    marginLeft: 8,
    marginRight: 8,
  },
  inputField: {
    flex: 1,
    height: 32,
    borderColor: '#141A1E',
    borderWidth: 1,
    paddingHorizontal: 10,
    borderRadius: 8,
    fontSize: 16,
  },
  genderContainer: {
    flexDirection: 'row',
    marginTop: 8,
  },
  genderOption: {
    borderWidth: 1,
    borderColor: '#141A1E',
    borderRadius: 20,
    paddingHorizontal: 12,
    paddingVertical: 8,
    marginRight: 8,
  },
  genderOptionSelected: {
    backgroundColor: '#5DCCFC',
    borderColor:'#5DCCFC',
  },
  genderOptionText: {
    fontSize: 12,
    color: '#141A1E',
  },
  selectedText: {
    color: 'white',
  },  
  logo: {
    position: 'absolute',
    top: 72, 
    width: 100, 
    height: 100 ,
  },
  medicalButtonsContainer: {
    flexDirection: 'row',
    marginTop: 16,
  },
  medicalButton: {
    borderWidth: 1,
    borderColor: '#141A1E',
    borderRadius: 20,
    paddingHorizontal: 12,
    paddingVertical: 8,
    marginRight: 8,
  },
  medicalButtonSelected: {
    backgroundColor: '#5DCCFC',
    borderColor:'#5DCCFC',
  },
  medicalButtonText: {
    fontSize: 12,
    color: '#141A1E',
  },
  loginButton: {
    backgroundColor: '#5DCCFC',
    paddingVertical: 12,
    paddingHorizontal: 24,
    borderRadius: 24,
    marginTop: 48,
  },
  continueButton: {
    backgroundColor: '#5DCCFC',
    paddingVertical: 12,
    paddingHorizontal: 24,
    borderRadius: 24,
    marginTop: 64,
  },
  continueButtonContainer: {
    alignItems: 'center',
  },
  loginButtonText: {
    color: 'white',
    fontSize: 16,
    fontWeight: 'bold',
  },
  continueButtonText: {
    color: 'white',
    fontSize: 16,
    fontWeight: 'bold',
  },
  buttonContainer: {
    position: 'absolute',
    top: 72, 
    left: 20,
  },
  buttonContainerRight: {
    left: 'auto',
    right: 20,
  },
  buttonContainerWide: {
    left: 'auto',
    right: 'auto',
  },
  button: {
    width: 40,
    height: 40,
    ...commonButtonStyles,
  },
  buttonWide: {
    flexDirection: 'row',
    paddingVertical: 12,
    paddingHorizontal: 24,
    left: 'auto',
    right: 'auto',
    ...commonButtonStyles,
  },
  buttonIcon: {
    marginRight: 8,
  },
  waterContainer: {
    alignItems: 'center',
    justifyContent: 'center',
  },
  waterTitle: {
    fontSize: 32, 
    fontWeight: 'bold',
    marginBottom: 8,
    color: '#5DCCFC', 
  },
  plusButton: {
    position: 'absolute',
    bottom: 20,
    right: 20,
    width: 60,
    height: 60,
    padding: 4,
    borderRadius: 30,
    backgroundColor: 'white',
    alignItems: 'center',
    justifyContent: 'center',
  },
  chartContainer: {
    marginBottom: 12,
    paddingHorizontal: 16,
    width: '90%', 
    borderWidth: 2, 
    borderColor: '#5DCCFC', 
    borderRadius: 8, 
    alignSelf: 'center', 
  },
  chartTitleContainer: {
    alignItems: 'flex-start',
    alignSelf: 'flex-start',
    marginLeft: 16,
    marginBottom: 16,
  },
  chartTitle: {
    marginTop: 16,
    fontSize: 16,
    fontWeight: 'bold',
  },
  profileTitle: {
    marginTop: 32,
    fontSize: 16,
    fontWeight: 'bold',
    alignItems: 'flex-start',
    alignSelf: 'flex-start',
    marginLeft: 8,
    marginBottom: 12,
  },
  textRow: {
  },
  verticalLine: {
    height: '100%',
    width: 1.5, 
    backgroundColor: '#ccc', 
    marginHorizontal: 12, 
  },  
  datePicker: {
    fontSize: 2,
    right: 4,
    marginBottom: 32,
  },
  shareButton: {
    marginTop: 12,
    marginBottom: 16,
    flexDirection: 'row',
    paddingVertical: 12,
    paddingHorizontal: 24,
    ...commonButtonStyles,
    backgroundColor: '#5DCCFC', 
  },
  buttonText: {
    color: 'white', 
    fontSize: 16,
    fontWeight: 'bold',
  },
  contentContainer: {
    width: '100%',
    paddingHorizontal: 20, 
  },
  drinkLogSection: {
    width: '100%', 
    paddingLeft: 20, 
    paddingRight: 20, 
  },
  drinkLogItem: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 8,
    backgroundColor: '#8EDCFC', 
    paddingVertical: 12, 
    paddingHorizontal: 16, 
    borderRadius: 24, 
    borderWidth: 2,
    borderColor: '#5DCCFC',
  },
   drinkLogItemUpcoming: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 8,
    backgroundColor: 'transparent', 
    paddingVertical: 12, 
    paddingHorizontal: 16, 
    borderRadius: 24, 
    borderWidth: 2,
    borderColor: '#5DCCFC',
  },
  drinkLogText: {
    fontSize: 16,
    color: 'white', 
    fontWeight: 'bold',
    textAlign: 'center', 
    flex: 1, 
  },
  drinkLogTextUpcoming: {
    fontSize: 16,
    color: '#5DCCFC', 
    fontWeight: 'bold',
    textAlign: 'center',
    flex: 1, 
  },
  drinkLogTime: {
    flex: 1, 
    textAlign: 'left', 
    color: 'white', 
    paddingLeft: 8, 
  },
  drinkLogAmount: {
    flex: 1, 
    textAlign: 'right', 
    color: 'white', 
    paddingRight: 8, 
  },
  drinkLogTimeUpcoming: {
    flex: 1, 
    textAlign: 'left', 
    color: '#5DCCFC', 
    paddingLeft: 8, 
  },
  drinkLogAmountUpcoming: {
    flex: 1, 
    textAlign: 'right', 
    color: '#5DCCFC', 
    paddingRight: 8, 
  },
  textBoxContainer: {
    flex: 1,

  },
  bigTextBox: {
    fontSize: 12,
    textAlign: 'left',
    textAlign: 'left',
  },
  circularButton: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: 'white',
    alignItems: 'center',
    justifyContent: 'center',
    position: 'absolute',
    top: 72,
  },
  backButton: {
    left: 20,
  },
  settingsButton: {
    right: 20,
  },
  profileMain: {
    paddingTop: 136,
    alignItems: 'center',
  },
  profileInitialCircle: {
    width: 100,
    height: 100,
    borderRadius: 50,
    borderWidth: 4,
    borderColor: '#5DCCFC', 
    backgroundColor: '#141A1E', 
    alignItems: 'center',
    justifyContent: 'center',
  },
  initialText: {
    fontSize: 64,
    color: 'white',
    fontWeight: 'bold',
  },
  fullName: {
    marginTop: 16,
    fontWeight: 'bold',
    fontSize: 16,
  },
  symCat: {
    fontSize: 12,
  },
  modalContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  modalContent: {
    backgroundColor: 'white',
    padding: 32,
    borderRadius: 16,
    shadowColor: '#000',
    shadowOpacity: 0.5,
    shadowOffset: { width: 0, height: 2 },
    shadowRadius: 24,
    borderWidth: 1,
    borderColor: '#384144', 
    width: '75%',
  },
  buttonContainer2: {
    flexDirection: 'row',
    justifyContent: 'space-between', 
    alignItems: 'center', 
    width: '100%', 
  },
  buttonContainer3: {
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 16, 
  },
  buttonBubble: {
    backgroundColor: '#5DCCFC',
    paddingVertical: 8,
    paddingHorizontal: 12,
    borderRadius: 20,
  },    
  submitButtonBubble: {
    backgroundColor: '#5DCCFC',
    paddingVertical: 8,
    paddingHorizontal: 12,
    borderRadius: 20,
    marginLeft: 'auto',
    marginTop: 12,
  },  
  buttonBubble2: {
    backgroundColor: 'white',
    paddingVertical: 8,
    paddingHorizontal: 12,
    borderRadius: 20,
    borderWidth: 1,
    borderColor: '#5DCCFC',
  },
  cancelButton: {
    marginRight: 64,
  },
  CancelText: {
    color: '#5DCCFC', 
    fontSize: 16,
  },  
  ConfirmText: {
    color: 'white', 
    fontSize: 16,
    fontWeight: 'bold',
  },
  SubmitText: {
    color: 'white', 
    fontSize: 12,
    fontWeight: 'bold',
  },
  modalText: {
    fontSize: 16,
    marginBottom: 32,
  },
  modalTextTitle: {
    fontWeight: 'bold',
    textAlign: 'center',
    fontSize: 16,
    marginBottom: 32,
  },
  symItem: {
    justifyContent: 'center',
    paddingHorizontal: 12, 
    paddingVertical: 12, 
    backgroundColor: '#F5F5F5', 
    borderRadius: 16, 
    borderColor: '#141A1E',
    borderWidth: 1,
    width: 310,
    marginBottom: 12,
  },
  symItemHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 8,
  },
  symItemHeaderText: {
    fontSize: 12,
    fontWeight: 'bold',
  },
  symItemText: {
    fontSize: 12,
  },
  drinkTypeContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginTop: 20,
  },
  drinkTypeButton: {
    borderWidth: 1,
    borderColor: '#5DCCFC',
    borderRadius: 20,
    paddingVertical: 8,
    paddingHorizontal: 16,
  },
  drinkTypeText: {
    color: '#5DCCFC',
  },
  selectedDrink: {
    backgroundColor: '#5DCCFC',
  },
  selectedText: {
    color: 'white',
    fontWeight: 'bold',
  },
});

const getShadowStyles = () => {
  if (Platform.OS === 'android') {
    return { elevation: 5 };
  } else if (Platform.OS === 'ios') {
    return {
      shadowColor: '#000',
      shadowOpacity: 0.1,
      shadowOffset: { width: 0, height: 2 },
      shadowRadius: 4,
    };
  } else {
    return {};
  }
};