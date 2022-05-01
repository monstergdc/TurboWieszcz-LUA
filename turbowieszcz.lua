
-- Turbo Wieszcz ++ LUA version, v1.0
-- (c)2022 Noniewicz.com, Jakub Noniewicz

-- translated directly from previous version written in Python
-- which was based directly on: previous version written in Delphi
-- which was based directly on: previous version written for Commodore C-64 sometime in 1993
-- by me (Jakub Noniewicz) and Freeak (Wojtek Kaczmarek)
-- which was based on:
-- idea presented in "Magazyn Amiga" magazine and implemented by Marek Pampuch.
-- also inspired by version written for iPhone by Tomek (Grych) Gryszkiewicz.
-- and versions written in C, JavaScript, Pascal, PHP and as CGI by Tomek (Grych) Gryszkiewicz.

-- you may use link below to run this code directly in the browser:
-- https://www.tutorialspoint.com/execute_lua_online.php

-- created: 20220501 (initial release took: 2.5h)
-- updated: -


ENDINGS1 = {'.', '...', '.', '!', '.'}
ENDINGS2 = {'', '...', '', '!', ''}
TRYB2ORDER = {{0,1,2,3}, {0,1,3,2}, {0,2,1,3}} -- ABAB, ABBA, AABB

titles = {
        'Zag�ada',
        'To ju� koniec',
        '�wiat ginie',
        'Z wizyt� w piekle',
        'Kataklizm',
        'Dzie� z �ycia...',
        'Masakra',
        'Katastrofa',
        'Wszyscy zginiemy...',
        'Pok�j?',
        'Koniec',
        'Koniec ludzko�ci',
        'Telefon do Boga',
        'Wieczne ciemno�ci',
        'Mrok',
        'Mrok w �rodku dnia',
        'Ciemno��',
        'Piorunem w �eb',
        'Marsz troli',
        'Szyderstwa Z�ego',
        'Okrpono�ci �wiata',
        'Umrze� po raz ostatni',
        'Pot�pienie',
        'B�l m�zgu',
        'Wieczne wymioty',
        'Zatrute dusze',
        'Uciekaj',
        'Apokalipsa',
        'Z�udzenie pryska',
        'Makabra',
        'Zag�ada �wiata',
        '�mier�',
        'Spok�j'
}

data = {}
for i = 0, 4-1 do
    data[i] = {}
    for j = 0, 32-1 do
        data[i][j] = ""
    end
end

-- ///////////////////////////////////////////////
-- //po 10
    data[0][0]  = 'Czy na te zbrodnie nie b�dzie kary?'
    data[0][1]  = 'Opustosza�y bagna, moczary'
    data[0][2]  = 'Na nic si� mod�y zdadz� ni czary'
    data[0][3]  = 'Z krwi mordowanych s�cz� puchary'
    data[0][4]  = 'To nietoperze, w�e, kalmary'
    data[0][5]  = 'Pr�no nieszcz�ni sypi� talary'
    data[0][6]  = 'Za co nam znosi� takie ci�ary'
    data[0][7]  = 'Z�owrogo iskrz� k�br okulary'
    data[0][8]  = 'Pr�no swe mod�y wznosi wikary'
    data[0][9]  = 'Pustosz� sny twoje z�e nocne mary'
    data[0][10] = 'Pr�no nieszcz�nik sypie talary'
    data[0][11] = 'Przedziwnie tka si� �ycia logarytm'
    data[0][12] = 'Ju� Strach wypu�ci� swoje ogary'
    data[0][13] = 'Niebawem zginiesz w szponach poczwary'
    data[0][14] = 'Wbijaj� pale z�ote kafary'
    data[0][15] = '�ycie odkrywa swoje przywary'
    data[0][16] = 'Na dnie ponurej, pustej pieczary'
    data[0][17] = 'Apokalipsy nadesz�y czary'
    data[0][18] = 'Upad�y anio� wspomina chwa��'
    data[0][19] = '�ycie ukrywa swoje przywary'
    data[0][20] = 'Dziwnych owad�w wzlatuj� chmary'
    data[0][21] = 'Bombowce bior� nasze namiary'
    data[0][22] = 'Nie da si� chwyci� z czartem za bary'
    data[0][23] = 'Pr�no frajerzy sypi� talary'
    data[0][24] = 'Nie da sie wyrwa� czartom towaru'
    data[0][25] = 'Po co nam s�czy� pod�e browary'
    data[0][26] = 'Diler ju� nie dostarczy towaru'
    data[0][27] = 'Lokomotywa nie ma ju� pary'
    data[0][28] = 'Gdy nie ka�dego sta� na browary'
    data[0][29] = 'Po�ar� Hilary swe okulary'
    data[0][30] = 'Spowi�y nas truj�ce opary'
    data[0][31] = 'To nie jest calka ani logarytm'
-- ///////////////////////////////////////////////
-- //po 8
    data[1][0]  = 'Ju� na aren� krew tryska'
    data[1][1]  = 'Ju� piana cieknie im z pyska'
    data[1][2]  = 'Ju� hen w oddali gdzie� b�yska'
    data[1][3]  = '�mier� w k�cie czai si� bliska'
    data[1][4]  = 'Niesamowite duch�w igrzyska'
    data[1][5]  = 'Ju� zaciskaj�c �apiska'
    data[1][6]  = 'Zamiast pozosta� w zamczyskach'
    data[1][7]  = 'Rzeka wylewa z �o�yska'
    data[1][8]  = 'Nieszcz�� wyla�a si� miska'
    data[1][9]  = 'Ju� zaciskaj�c z�biska'
    data[1][10] = 'Otwarta nieszcz�� walizka'
    data[1][11] = 'Niczym na rzymskich boiskach'
    data[1][12] = 'Czart wznieca swe paleniska'
    data[1][13] = 'A w mroku �wiec� z�biska'
    data[1][14] = 'Zewsz�d dochodz� wyzwiska'
    data[1][15] = '�wi�tych g��d wiary przyciska'
    data[1][16] = 'Ponuro patrzy z ich pyska'
    data[1][17] = 'Mg�a stoi na uroczyskach'
    data[1][18] = 'Ko�ci pogrzebi� urwiska'
    data[1][19] = 'G��d wiary tak nas przyciska'
    data[1][20] = 'Run�y skalne zwaliska'
    data[1][21] = 'Czart rozpala paleniska'
    data[1][22] = 'A w mroku s�ycha� wyzwiska'
    data[1][23] = 'Zn�w pusta �ebraka miska'
    data[1][24] = 'Diabelskie to s� igrzyska'
    data[1][25] = 'Nie powiedz diab�u nazwiska'
    data[1][26] = 'Najg�o�niej s�ycha� wyzwiska'
    data[1][27] = 'Diabelskie maj� nazwiska'
    data[1][28] = 'Tam uciekaj� ludziska'
    data[1][29] = 'Tak rzecze stara hipiska'
    data[1][30] = 'Gdzie dawne ludzi siedliska'
    data[1][31] = 'Najg�o�niej piszczy hipiska'
-- ///////////////////////////////////////////////
-- //po 10
    data[2][0]  = 'Rw� pazurami swoje ofiary'
    data[2][1]  = 'Nic nie pomo�e tu druid stary'
    data[2][2]  = 'To nocne zjawy i senne mary'
    data[2][3]  = 'Niegro�ne przy nich lwowskie batiary'
    data[2][4]  = 'Pod wodz� ksi�nej diablic Tamary'
    data[2][5]  = 'Z dala straszliwe tr�bia fanfary'
    data[2][6]  = 'Sk�d ich przywiod�y piek�a bezmiary'
    data[2][7]  = 'Za� dooko�a �uny, po�ary'
    data[2][8]  = 'A twoje cia�o rozszarpie Wilk Szary'
    data[2][9]  = 'Tu nie pomo�e ju� si�a wiary'
    data[2][10] = 'Tak cudzych nieszcz�� pij� nektary'
    data[2][11] = 'Wszystko zalewa wrz�cy liparyt'
    data[2][12] = 'Zab�jcze s� ich niecne zamiary'
    data[2][13] = 'Zatrute dusze ��cz� si� w pary'
    data[2][14] = '�wiat pokazuje swoje wymiary'
    data[2][15] = 'Z �yciem si� teraz we�miesz za bary'
    data[2][16] = 'Brak uczu�, ch�ci, czasem brak wiary'
    data[2][17] = 'Wspomnij, co m�wi� Mickiewicz stary'
    data[2][18] = 'Spalonych las�w strasz� hektary'
    data[2][19] = 'Z �yciem si� dzisiaj we�miesz za bary'
    data[2][20] = 'Ksi�dz pozostaje nagle bez wiary'
    data[2][21] = 'Papie� zaczyna odprawia� czary'
    data[2][22] = 'Tu nie pomo�e paciorek, stary'
    data[2][23] = 'Niegro�ne przy nich nawet Atari'
    data[2][24] = 'Takie s� oto piek�a bezmiary'
    data[2][25] = 'A teraz nagle jeste� ju� stary'
    data[2][26] = 'Mordercy licz� swoje ofiary'
    data[2][27] = 'I bez warto�ci s� ju� dolary'
    data[2][28] = 'Gdzie si� podzia�y te nenufary'
    data[2][29] = 'Upada oto d�b ten prastary'
    data[2][30] = 'Bystro �migaj� nawet niezdary'
    data[2][31] = 'Ju� nieruchome ich awatary'
-- ///////////////////////////////////////////////
-- //po 8
    data[3][0]  = 'Wnet na nas te� przyjdzie kryska'
    data[3][1]  = 'Znik�d �adnego schroniska'
    data[3][2]  = 'Powietrze tnie �wist biczyska'
    data[3][3]  = 'Rodem z czarciego urwiska'
    data[3][4]  = 'I sw�d niezno�ny si� wciska'
    data[3][5]  = 'Huk, jak z wielkiego lotniska'
    data[3][6]  = 'Z�owroga brzmi� ich nazwiska'
    data[3][7]  = 'W k�cie nie�mia�o kto� piska'
    data[3][8]  = 'Kto� obok morduje liska'
    data[3][9]  = 'Krwi� ociekaj� z�biska'
    data[3][10] = 'Woko�o dzikie piar�yska'
    data[3][11] = 'I ��dza czai si� niska'
    data[3][12] = 'Diabe� ci� dzisiaj wyzyska'
    data[3][13] = 'P�on� zag�ady ogniska'
    data[3][14] = 'Gwa�t niech si� gwa�tem odciska!'
    data[3][15] = 'Stoisz na skraju urwiska'
    data[3][16] = 'Tam szatan czarta wyiska'
    data[3][17] = 'Uciekaj, przysz�o�� jest mglista'
    data[3][18] = 'Nadziei z�udzenie pryska'
    data[3][19] = 'Wydziobi� oczy ptaszyska'
    data[3][20] = 'Padaj� �by na klepisko'
    data[3][21] = '�mier� zbiera �niwo w ko�yskach'
    data[3][22] = 'Co� znowu zgrzyta w �o�yskach'
    data[3][23] = 'Spadasz z wielkiego urwiska'
    data[3][24] = 'Lawa spod ziemi wytryska'
    data[3][25] = 'Woko�o grzmi albo b�yska'
    data[3][26] = 'Fa�szywe z�oto po�yska'
    data[3][27] = 'Najwi�cej czart tu uzyska'
    data[3][28] = 'Owieczki Z�y tu pozyska'
    data[3][29] = 'Owieczki spad�y z urwiska'
    data[3][30] = 'Snuj� si� dymy z ogniska'
    data[3][31] = 'To czarne lec� ptaszyska'

    number = {}
    ending = {}


function _check_uniq_ok(z, w, value, repetitions_ok)
    ok = true
    if repetitions_ok == false then
        for i = 0, z-1 do
            if (number[w][i] == value) then ok = false end
        end
    end
    return ok
end

function _set_random_row(z, w, repetitions_ok)
    while true do
        number[w][z] = math.random(0, #data[w]-1)
        if ((z == 0) or _check_uniq_ok(z, w, number[w][z], repetitions_ok)) then break end
    end
end

function _build_ending(z, w, s)
    chk = true
    result = ''
    if (#s > 0) then
        if (s[#s] == '?') or (s[#s] == '!') then
            chk = False
        end
    end
    if ((w == 1) and chk) then
        result = ENDINGS2[ending[0][z]]
    end
    if ((w == 3) and chk) then
        result = ENDINGS1[ending[1][z]]
    end
    return result
end

function _build_line(z, w, w0)
    s = data[w][number[w][z]]
    return ' ' .. s .. _build_ending(z, w0, s) .. "\n"
end

function _build_stanza(z, verse_mode)
    return
      _build_line(z, TRYB2ORDER[verse_mode][0+1], 0) ..
      _build_line(z, TRYB2ORDER[verse_mode][1+1], 1) ..
      _build_line(z, TRYB2ORDER[verse_mode][2+1], 2) ..
      _build_line(z, TRYB2ORDER[verse_mode][3+1], 3)
end

function generate_poem(cnt, verse_mode, repetitions_ok)
    if cnt < 1 then return "" end


    stanza_count = cnt
    if (stanza_count > 32) then stanza_count = 32 end
    title_id = math.random(1, #titles)

    math.randomseed(os.time())

    for i = 0, stanza_count-1 do
        number[i] = {}
        ending[i] = {}
        for j = 0, 4-1 do
            number[i][j] = 0
        end
        for j = 0, 2-1 do
            ending[i][j] = 0
        end
    end

    for z = 0, stanza_count-1 do
        for w = 0, 4-1 do
            number[w][z] = -1
            ending[0][z] = math.random(1, #ENDINGS2)
            ending[1][z] = math.random(1, #ENDINGS1)
            _set_random_row(z, 0, repetitions_ok)
            _set_random_row(z, 1, repetitions_ok)
            _set_random_row(z, 2, repetitions_ok)
            _set_random_row(z, 3, repetitions_ok)
        end
    end

    poem = "\n " .. titles[title_id] .. "\n\n"
    for z = 0, stanza_count-1 do
        poem = poem .. _build_stanza(z, verse_mode+1) .. "\n"
    end
    return poem
end

-- run

io.write('Podaj ilo�� zwrotek (1-32): ')
local cnt = io.read("*n")
io.write('\n\n')

print(generate_poem(cnt, 0, false))

