// From Giorgio Evangelista
// GEVA elettronica
// See Timer Example

// Fin che viene resettato non scatta.
// Dopo il tempo impostato, che non viene più resettato, scatta.

#ifndef TIMER_H
#define TIMER_H

#include <stdbool.h>

// Dichiarazione della funzione millis() se non è definita altrove
#ifndef MILLIS_DECLARED
unsigned long millis(void);
#define MILLIS_DECLARED
#endif

typedef struct {
    unsigned long _Time;
    unsigned long _Timer;
    bool ff;
} Timer;

// Funzioni per inizializzare il timer
void Timer_init(Timer* timer, unsigned long _t);
void Timer_init_default(Timer* timer);

// Funzioni del timer
void Timer_reset(Timer* timer);
void Timer_set(Timer* timer);
bool Timer_stato(Timer* timer);
bool Timer_fronte(Timer* timer);
void Timer_tempo(Timer* timer, unsigned long _t);

#endif // TIMER_H
