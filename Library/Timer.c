#include "Timer.h"

// Funzione per inizializzare il timer con un tempo specifico
void Timer_init(Timer* timer, unsigned long _t) {
    timer->_Time = _t;
    timer->_Timer = millis();
    timer->ff = false;
}

// Funzione per inizializzare il timer senza tempo specifico
void Timer_init_default(Timer* timer) {
    timer->_Timer = millis();
    timer->_Time = 0;
    timer->ff = false;
}

// Reset del timer
void Timer_reset(Timer* timer) {
    timer->_Timer = millis();
    timer->ff = false;
}

// Set del timer
void Timer_set(Timer* timer) {
    timer->_Timer = millis() - timer->_Time - 1;
    timer->ff = true;
}

// Verifica dello stato del timer
bool Timer_stato(Timer* timer) {
    return (millis() - timer->_Timer >= timer->_Time);
}

// Verifica del fronte del timer
bool Timer_fronte(Timer* timer) {
    if (millis() - timer->_Timer >= timer->_Time) {
        if (!timer->ff) {
            timer->ff = true;
            return true;
        }
    } else {
        timer->ff = false;
    }
    return false;
}

// Imposta il tempo del timer
void Timer_tempo(Timer* timer, unsigned long _t) {
    timer->_Time = _t;
} 